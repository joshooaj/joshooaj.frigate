function New-FrigateSession {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [uri]
        $Uri,

        [Parameter(Mandatory)]
        [pscredential]
        $Credential
    )

    process {
        $builder = [uribuilder]$Uri
        $builder.Path += 'api/login'
        $splat = @{
            Uri         = $builder.Uri
            Method      = 'Post'
            ContentType = 'application/json'
            Body        = [pscustomobject]@{
                user     = $Credential.UserName
                password = $Credential.GetNetworkCredential().Password
            } | ConvertTo-Json
            WebSession  = [Microsoft.PowerShell.Commands.WebRequestSession]::new()
            ErrorAction = 'Stop'
        }
        $null = Invoke-RestMethod @splat

        [pscustomobject]@{
            BaseUri    = $Uri
            WebSession = $splat.WebSession
        }
    }
}
