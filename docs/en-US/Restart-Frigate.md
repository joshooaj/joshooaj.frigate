---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Restart-Frigate

## SYNOPSIS
Restart a Frigate server instance.

## SYNTAX

```
Restart-Frigate [[-Session] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Requests a restart of the Frigate server. This triggers the server's restart endpoint and will briefly interrupt recording, streaming, and API availability.

## EXAMPLES

### Example 1
```powershell
Restart-Frigate
```

Requests the remote Frigate server to restart. Expect a short service outage while the server restarts.

## PARAMETERS

### -Session
A session object created by `New-FrigateSession` representing an authenticated connection to the Frigate server. If omitted, the cmdlet will attempt to use the last session created in this PowerShell session.

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
## NOTES

## RELATED LINKS
