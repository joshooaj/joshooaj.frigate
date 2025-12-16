function New-FrigateUser {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop),

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
