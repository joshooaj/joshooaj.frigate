function Get-FrigateProfile {
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
        $Session
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
