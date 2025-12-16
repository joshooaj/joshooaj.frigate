function Restart-Frigate {
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
            Path    = 'api/restart'
            Method  = 'Post'
        }
        Invoke-FrigateApi @splat
    }
}
