function Restart-Frigate {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop)
    )

    process {
        $builder = [uribuilder]$Session.BaseUri
        $builder.Path += 'api/restart'
        $splat = @{
            Uri         = $builder.Uri
            Method      = 'Post'
            WebSession  = $Session.WebSession
        }
        Invoke-RestMethod @splat
    }
}
