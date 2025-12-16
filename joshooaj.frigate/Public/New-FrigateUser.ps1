function New-FrigateUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [pscredential]
        $Credential,

        [Parameter()]
        [ValidateSet('admin', 'viewer')]
        [string]
        $Role = 'viewer',

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop)
    )

    process {
        $splat = @{
            Session = $Session
            Path    = 'api/users'
            Method  = 'Post'
            Body    = @{
                username = $Credential.UserName
                password = $Credential.GetNetworkCredential().Password
                role     = $Role
            }
        }
        Invoke-FrigateApi @splat
    }
}
