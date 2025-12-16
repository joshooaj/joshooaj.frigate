function Invoke-FrigateApi {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateScript({ TestSession -Session $_ -ErrorAction Stop })]
        [object]
        $Session = (GetLastSession -ErrorAction Stop),

        [Parameter(Mandatory)]
        [string]
        $Path,

        [Parameter()]
        [string]
        $Method = 'Get',

        [Parameter()]
        [System.Collections.IDictionary]
        $Body
    )

    process {
        $builder = [uribuilder]$Session.BaseUri
        $builder.Path += $Path.TrimStart('/')
        $splat = @{
            Uri         = $builder.Uri
            Method      = $Method
            WebSession  = $Session.WebSession
            ContentType = 'application/json'
        }

        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Body')) {
            $data = @{}
            foreach ($key in $Body.Keys) {
                $data[$key] = $Body[$key]
            }
            $splat.Body = [pscustomobject]$data | ConvertTo-Json
            $splat.ContentType = 'application/json'
        }
        Invoke-RestMethod @splat
    }
}
