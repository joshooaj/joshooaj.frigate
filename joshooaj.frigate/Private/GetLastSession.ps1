function GetLastSession {
    [CmdletBinding()]
    param ()

    process {
        if ($null -eq $script:LastSession) {
            Write-Error "There is no active Frigate session. Use New-FrigateSession to connect to your Frigate NVR."
            return
        }
        $script:LastSession
    }
}
