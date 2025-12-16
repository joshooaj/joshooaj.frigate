function Get-FrigateProfile {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop)
    )

    process {
        $builder = [uribuilder]$Session.BaseUri
        $builder.Path += 'api/profile'
        $splat = @{
            Uri         = $builder.Uri
            Method      = 'Get'
            WebSession  = $Session.WebSession
        }
        Invoke-RestMethod @splat
    }
}
