---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Get-FrigateReview

## SYNOPSIS
Retrieve reviewable events from the Frigate server (for manual review workflows).

## SYNTAX

```
Get-FrigateReview [[-Camera] <String[]>] [[-Label] <String[]>] [[-After] <DateTime>] [[-Before] <DateTime>]
 [[-Session] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Queries the Frigate review endpoint and returns events that require or have been marked for review. Use filters to limit results by camera(s), label(s), and time range.

Each returned object includes the usual event fields and convenience `StartTime`/`EndTime` properties converted to your local time.

## EXAMPLES

### Example 1
```powershell
Get-FrigateReview -After (Get-Date).AddDays(-1) | Select-Object StartTime, EndTime, camera
```

Lists review events from the last 24 hours with key columns for quick inspection.

## PARAMETERS

### -After
Return events that started after the specified `DateTime` value.

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
Return events that started before the specified `DateTime` value.

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
Array of camera names to include (for example `frontdoor`). Pass multiple values to filter several cameras.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Label
Array of labels (for example `person`, `car`) to filter returned review items. Case-insensitive.

```yaml
Type: String[]
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
## NOTES

## RELATED LINKS
