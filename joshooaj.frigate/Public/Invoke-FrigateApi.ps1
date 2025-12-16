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
        $Body,

        [Parameter()]
        [System.Collections.IDictionary]
        $Query
    )

    process {
        $builder = [uribuilder]$Session.BaseUri
        $builder.Path += $Path.TrimStart('/')
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Query')) {
            $queryParams = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)
            foreach ($key in $Query.Keys) {
                $queryParams.Add($key, $Query[$key])
            }
            $builder.Query = $queryParams.ToString()
        }

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

        # TODO: Do error handling if Frigate API has consistent documented error responses
        Invoke-RestMethod @splat
    }
}
