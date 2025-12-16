---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Get-FrigateUsers

## SYNOPSIS
List user accounts configured on the Frigate server.

## SYNTAX

```
Get-FrigateUsers [[-Session] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Returns the list of user accounts and their roles from the Frigate server. Use this command to audit accounts or verify user roles.

## EXAMPLES

### Example 1
```powershell
Get-FrigateUsers
```

Displays all configured users and their roles.

## PARAMETERS

### -Session
A session object created by `New-FrigateSession` that represents an authenticated connection to a Frigate server. If omitted, the cmdlet will attempt to use the last session created in this PowerShell session.

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
