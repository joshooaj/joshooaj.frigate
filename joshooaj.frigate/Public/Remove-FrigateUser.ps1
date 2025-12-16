function Remove-FrigateUser {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop),

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $Username
    )

    process {
        $builder = [uribuilder]$Session.BaseUri
        $builder.Path += 'api/users/' + [system.web.HttpUtility]::UrlEncode($Username)
        $splat = @{
            Uri         = $builder.Uri
            Method      = 'Delete'
            WebSession  = $Session.WebSession
        }
        Invoke-RestMethod @splat
    }
}
