function Remove-FrigateUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $Username,

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop)
    )

    process {
        $splat = @{
            Session = $Session
            Path    = 'api/users/' + [system.web.HttpUtility]::UrlEncode($Username)
            Method  = 'Delete'
        }
        Invoke-FrigateApi @splat
    }
}
