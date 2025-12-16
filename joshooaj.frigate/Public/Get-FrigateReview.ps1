function Get-FrigateReview {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Camera,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Label,

        [Parameter()]
        [datetime]
        $After,

        [Parameter()]
        [datetime]
        $Before,

        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop)
    )

    process {
        $splat = @{
            Session = $Session
            Path    = 'api/review'
            Method  = 'Get'
            Query   = @{}
        }
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Camera')) {
            $splat.Query['cameras'] = $Camera -join ','
        }
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Label')) {
            $splat.Query['label'] = ($Label -join ',').ToLower()
        }
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('After')) {
            $splat.Query['after'] = [datetimeoffset]::new($After).ToUnixTimeMilliseconds() / 1000
        }
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Before')) {
            $splat.Query['before'] = [datetimeoffset]::new($Before).ToUnixTimeMilliseconds() / 1000
        }
        $events = Invoke-FrigateApi @splat
        foreach ($e in $events) {
            $startTime = [datetime]::SpecifyKind([datetimeoffset]::FromUnixTimeMilliseconds($e.start_time * 1000).DateTime, [datetimekind]::Utc).ToLocalTime()
            $endTime = [datetime]::SpecifyKind([datetimeoffset]::FromUnixTimeMilliseconds($e.end_time * 1000).DateTime, [datetimekind]::Utc).ToLocalTime()
            $e | Add-Member -MemberType NoteProperty -Name StartTime -Value $startTime
            $e | Add-Member -MemberType NoteProperty -Name EndTime -Value $endTime
            $e
        }
    }
}
