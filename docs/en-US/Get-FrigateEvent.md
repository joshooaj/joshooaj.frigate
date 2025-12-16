---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Get-FrigateEvent

## SYNOPSIS
Retrieves recent events (detections, alerts) from a Frigate server.

## SYNTAX

```
Get-FrigateEvent [[-Camera] <String>] [[-Label] <String>] [[-After] <DateTime>] [[-Before] <DateTime>]
 [[-Session] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Queries the Frigate API for recorded events (for example, detected people, vehicles, or other tracked objects). Use optional filters to limit results by camera, label (object type), or time range.

Each returned event is a PowerShell object that mirrors the server's event record and includes two convenience properties, `StartTime` and `EndTime`, which are the event timestamps converted to your local time zone.

Common event fields you will see include:

- `id` - unique event identifier
- `camera` - camera name (example: `frontdoor`)
- `label` - detected object label (example: `person`)
- `start_time`, `end_time` - epoch timestamps returned by the server
- `has_clip`, `has_snapshot` - booleans indicating stored media availability
- `data` - additional event details (box, score, attributes, etc.)

The `-After` and `-Before` parameters accept PowerShell `DateTime` values; the cmdlet converts them into the format expected by the Frigate API.

Be careful when sharing event output - records may reference camera names, snapshots, or other operational details. Redact sensitive information (hostnames, credentials, or identifiable imagery) before sharing externally.

## EXAMPLES

### Example 1

```powershell
Get-FrigateEvent -After (Get-Date).AddDays(-1) | Format-Table StartTime, EndTime, camera, label, has_clip
```

Get recent events from the last 24 hours and list basic columns.

### Example 2

```powershell
Get-FrigateEvent -Camera frontdoor -After (Get-Date).AddHours(-6)
```

Show events for a single camera named `frontdoor`.

### Example 3

```powershell
Get-FrigateEvent -Label person -After (Get-Date).AddDays(-7) | ConvertTo-Json -Depth 5 | Out-File .\person-events.json -Encoding utf8
```

Retrieve only `person` events and save them to a file for later.

### Example 4

```powershell
$session = New-FrigateSession -Uri 'https://frigate.example.local' -Credential (Get-Credential)
$session | Get-FrigateEvent -After (Get-Date).AddHours(-1)
```

Query using an explicit session object created earlier.

## PARAMETERS

### -After
Filter results to events that occurred after the provided datetime.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Before
Filter results to events that occurred before the provided datetime.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Camera
Filter results to a specific camera by name (string). Example: `frontdoor`.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Label
Filter results to a specific detection label (for example `person`, `car`). The value is case-insensitive.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Session

A session object created by `New-FrigateSession` that represents an authenticated connection to a Frigate server. If omitted, the cmdlet will attempt to use the last session created in this PowerShell session.

Accepts pipeline input by value or by property name.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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

Each object represents a single Frigate event. The returned object includes the server fields plus `StartTime` and `EndTime` (converted to local time) for easy display.

## NOTES

If the command reports the session is missing or invalid, run `New-FrigateSession` to create a session and try again.

Events may reference stored clips or snapshots - `has_clip` and `has_snapshot` indicate whether media is available on the server for that event.

## RELATED LINKS
