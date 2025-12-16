---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Remove-FrigateUser

## SYNOPSIS
Remove a user account from the Frigate server.

## SYNTAX

```
Remove-FrigateUser [-Username] <String> [[-Session] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Deletes the specified user account from the Frigate server. This operation is permanent - removed users will no longer be able to authenticate.

## EXAMPLES

### Example 1
```powershell
Remove-FrigateUser -Username bob
```

Removes the user `bob` from the Frigate server.

## PARAMETERS

### -Session
A session object created by `New-FrigateSession` that represents an authenticated connection to a Frigate server. If omitted, the cmdlet will attempt to use the last session created in this PowerShell session.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Username
The username of the account to remove. This value is required.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

### System.String

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
