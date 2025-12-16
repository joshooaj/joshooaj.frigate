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
        $session = [pscustomobject]@{
            BaseUri    = $Uri
            WebSession = [Microsoft.PowerShell.Commands.WebRequestSession]::new()
        }
        $splat = @{
            Session = $session
            Path    = 'api/login'
            Method  = 'Post'
            Body    = @{
                user     = $Credential.UserName
                password = $Credential.GetNetworkCredential().Password
            }
            ErrorAction = 'Stop'
        }
        $null = Invoke-FrigateApi @splat
        ($script:LastSession = $session)
    }
}
