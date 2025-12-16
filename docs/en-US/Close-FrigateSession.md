---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Close-FrigateSession

## SYNOPSIS
Closes an active session with a Frigate server.

## SYNTAX

```
Close-FrigateSession [[-Session] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Closes (logs out) a previously opened connection to a Frigate server. Use this command when you are finished working with a Frigate instance and want to end the authenticated session.

You can run the command without arguments to close the last session created during this PowerShell session, or provide a session object if you have one saved from `New-FrigateSession`.

On success the session is terminated on the remote server.

## EXAMPLES

### Example 1

```powershell
Close-FrigateSession
```

Close the most recently created session.

### Example 2

```powershell
$session = New-FrigateSession -BaseUri 'https://frigate.example.local' -ApiKey $env:FRIGATE_API_KEY
$session | Close-FrigateSession
```

This closes a specific session object created earlier and ends the authenticated session on the Frigate server.

## PARAMETERS

### -Session

A session object created by `New-FrigateSession` representing an open connection to a Frigate server. If you don't provide a session, the command will attempt to close the last session used in this PowerShell session.

Accepts pipeline input by value.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[New-FrigateSession](https://github.com/joshooaj/joshooaj.frigate/blob/main/docs/en-US/New-FrigateSession.md)
