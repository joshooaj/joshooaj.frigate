---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Get-FrigateConfig

## SYNOPSIS
Retrieves the current configuration from a Frigate server.

## SYNTAX

```
Get-FrigateConfig [[-Session] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Returns the active Frigate server configuration as provided by the server's API. Use this command when you need to inspect server settings for troubleshooting, auditing, or backup purposes.

The command returns the server configuration as a PowerShell object (converted from JSON). Typical information includes Frigate version, authentication settings, database location, MQTT settings, camera definitions, recording and snapshot retention, detector/model settings, and other operational flags. The exact structure can vary by Frigate version.

Run the command without arguments to query the last session created in this PowerShell session, or pass a session object obtained from `New-FrigateSession`.

Be cautious: the configuration may contain sensitive values (for example hostnames, MQTT credentials, or other integration settings). Handle output accordingly.

## EXAMPLES

### Example 1

```powershell
Get-FrigateConfig | ConvertTo-Json -Depth 10
```

Display the configuration in the console (pretty-printed JSON).

### Example 2

```powershell
Get-FrigateConfig | ConvertTo-Json -Depth 10 | Out-File -FilePath .\frigate-config.json -Encoding utf8
```

Save the configuration to a file for inspection or backup.

### Example 3

```powershell
$session = New-FrigateSession -Uri 'https://frigate.example.local' -Credential (Get-Credential)
$session | Get-FrigateConfig
```

Get the configuration using a specific session object.

## PARAMETERS

### -Session

A session object created by `New-FrigateSession` that represents an authenticated connection to a Frigate server. If omitted, the cmdlet will attempt to use the last session created in this PowerShell session.

Accepts pipeline input by property name or by value. Use `New-FrigateSession` to create a session object.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### System.Object

Returns a PowerShell object (typically a PSCustomObject) that mirrors the JSON configuration returned by the Frigate API.

Common top-level sections you will see:

- `version` - Frigate version string.
- `auth` - authentication settings (enabled, cookie name, session length).
- `database.path` - location of the Frigate SQLite database.
- `mqtt` - MQTT integration settings (enabled, host, port, topic prefix).
- `cameras` - per-camera configuration blocks (inputs, ffmpeg, detect, record, snapshots, etc.).
- `detectors` / `model` - object detection and model settings.
- `record` / `snapshots` - recording and snapshot retention settings.
- `lpr`, `face_recognition` - license-plate and face recognition settings if enabled.

Note: The payload can be large for systems with many cameras; use filtering or save to file when necessary.

## NOTES

If the command returns an error about the session being missing or invalid, create a session with `New-FrigateSession` and try again.

For large outputs, use `ConvertTo-Json -Depth 10` or `Out-File` to capture the full structure. Avoid pasting full configurations into public channels - redact any credentials or sensitive endpoints first.

## RELATED LINKS

[New-FrigateSession](https://github.com/joshooaj/joshooaj.frigate/blob/main/docs/en-US/New-FrigateSession.md)
