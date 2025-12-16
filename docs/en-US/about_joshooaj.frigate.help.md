# joshooaj.frigate

## about_joshooaj.frigate

# SHORT DESCRIPTION
PowerShell module for administering and querying Frigate NVRs.

# LONG DESCRIPTION
This module provides a set of PowerShell cmdlets to authenticate to, query, and
manage Frigate servers via their HTTP API. It is intended for technical types
like system administrators who need to inspect configuration, list events,
manage users, or perform administrative actions such as restarting a Frigate
instance.

Commands are simple wrappers around Frigate API endpoints and return PowerShell
objects suitable for inspection, filtering, or export. Use `New-FrigateSession`
to authenticate, then run subsequent commands against that session.

## Optional Subtopics
Common tasks:

- Inspecting server configuration (`Get-FrigateConfig`).
- Listing recent events (`Get-FrigateEvent`, `Get-FrigateReview`).
- Managing users (`Get-FrigateUsers`, `New-FrigateUser`, `Set-FrigateUser`, `Remove-FrigateUser`).

# EXAMPLES
Create an authenticated session and list users:

```powershell
$cred = Get-Credential -Message 'Frigate admin credentials'
New-FrigateSession -Uri 'https://frigate.example.local' -Credential $cred
Get-FrigateUsers
```

This creates a session and displays configured users.

# NOTE
Commands that modify server state (creating users, restarting the server, changing passwords) require appropriate administrative privileges. Actions may interrupt recording or streaming.

# TROUBLESHOOTING NOTE
If an operation fails with an authentication error, verify credentials and that the Frigate server is reachable from the machine running the cmdlets. For network problems, confirm the server URI and any firewall or proxy settings.

# KEYWORDS
- frigate
- video analytics
- surveillance
- NVR
- VMS
- CCTV
