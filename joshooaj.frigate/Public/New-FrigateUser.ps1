function New-FrigateUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateScript({
                if ($null -eq $_.BaseUri) {
                    throw ([System.ArgumentException]::new('BaseUri property is missing.'))
                }
                if ($null -eq $_.WebSession) {
                    throw ([System.ArgumentException]::new('WebSession property is missing.'))
                }
                $true
            }, ErrorMessage = 'Session invalid. Use New-FrigateSession to start a new session.')]
        [object]
        $Session,

        [Parameter(Mandatory)]
        [pscredential]
        $Credential,

        [Parameter()]
        [ValidateSet('admin', 'viewer')]
        [string]
        $Role = 'viewer'
    )

    process {
        $builder = [uribuilder]$Session.BaseUri
        $builder.Path += 'api/users'
        $splat = @{
            Uri         = $builder.Uri
            Method      = 'Post'
            WebSession  = $Session.WebSession
            ContentType = 'application/json'
            Headers     = @{
                Accept = 'application/json'
            }
            Body        = [pscustomobject]@{
                username = $Credential.UserName
                password = $Credential.GetNetworkCredential().Password
                role     = $Role
            } | ConvertTo-Json
        }
        Invoke-RestMethod @splat
    }
}
