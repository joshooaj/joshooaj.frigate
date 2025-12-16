function Close-FrigateSession {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)]
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
        $Session = $script:LastSession
    )

    process {
        $splat = @{
            Session = $Session
            Path    = 'api/logout'
            Method  = 'Get'
        }
        $null = Invoke-FrigateApi @splat
    }
}
