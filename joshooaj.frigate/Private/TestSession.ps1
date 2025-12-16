function TestSession {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [object]
        $Session
    )

    process {
        if ($null -eq $Session.BaseUri -or $Session.BaseUri -isnot [uri]) {
            throw ([System.ArgumentException]::new('Invalid session object. The BaseUri property is missing or it is not a [uri].'))
        }
        if ($null -eq $Session.WebSession -or $Session.WebSession -isnot [Microsoft.PowerShell.Commands.WebRequestSession]) {
            throw ([System.ArgumentException]::new('Invalid session object. The WebSession property is missing or it is not a [WebRequestSession].'))
        }
        $true
    }
}
