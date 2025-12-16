function Get-FrigateProfile {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop)
    )

    process {
        $splat = @{
            Session = $Session
            Path    = 'api/profile'
            Method  = 'Get'
        }
        Invoke-FrigateApi @splat
    }
}
