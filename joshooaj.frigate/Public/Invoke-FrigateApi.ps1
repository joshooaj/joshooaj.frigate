function Invoke-FrigateApi {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateScript({
                if ($null -eq $_.BaseUri) {
                    throw ([System.ArgumentException]::new('BaseUri property is missing.'))
                }
                if ($null -eq $_.WebSession) {
                    throw ([System.ArgumentException]::new('WebSession property is missing.'))
                }
                $true
            }, ErrorMessage = 'Session invalid. Use New-FrigateSession to start a new session.')]
        [object]
        $Session,

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
