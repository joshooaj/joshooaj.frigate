function Set-FrigateUser {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop),

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $Username,

        [Parameter(ValueFromPipelineByPropertyName)]
        [securestring]
        $Password,

        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateSet('admin', 'viewer')]
        [string]
        $Role
    )

    process {
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Password')) {
            $credential = [pscredential]::new('a', $Password)
            $builder = [uribuilder]$Session.BaseUri
            $builder.Path += 'api/users/' + [system.web.HttpUtility]::UrlEncode($Username) + '/password'
            $splat = @{
                Uri         = $builder.Uri
                Method      = 'Put'
                WebSession  = $Session.WebSession
                ContentType = 'application/json'
                Headers     = @{
                    Accept = 'application/json'
                }
                Body        = [pscustomobject]@{
                    password = $credential.GetNetworkCredential().Password
                } | ConvertTo-Json
                ErrorAction = 'Stop'
            }
            $result = Invoke-RestMethod @splat
            if (!$result.success) {
                Write-Error -Message "Failed to update the password for user '$User'" -TargetObject $result
            }
        }
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Role')) {
            $builder = [uribuilder]$Session.BaseUri
            $builder.Path += 'api/users/' + [system.web.HttpUtility]::UrlEncode($Username) + '/role'
            $splat = @{
                Uri         = $builder.Uri
                Method      = 'Put'
                WebSession  = $Session.WebSession
                ContentType = 'application/json'
                Headers     = @{
                    Accept = 'application/json'
                }
                Body        = [pscustomobject]@{
                    role = $Role
                } | ConvertTo-Json
                ErrorAction = 'Stop'
            }
            $result = Invoke-RestMethod @splat
            if (!$result.success) {
                Write-Error -Message "Failed to update the role for user '$User'" -TargetObject $result
            }
        }

        if (!$PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Password')) {
            if (!$PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Role')) {
                Write-Warning "No new password or role provided for user $User"
            }
        }
    }
}
