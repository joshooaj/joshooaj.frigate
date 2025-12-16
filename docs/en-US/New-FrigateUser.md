---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# New-FrigateUser

## SYNOPSIS
Create a new user account on a Frigate server.

## SYNTAX

```
New-FrigateUser [-Credential] <PSCredential> [[-Role] <String>] [[-Session] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Creates a new user on the Frigate server using the supplied credentials and role. Provide a `PSCredential` object (for username and password) and optionally specify `-Role` (default is `viewer`).

## EXAMPLES

### Example 1
```powershell
$cred = Get-Credential -Message 'Enter new user credentials'
New-FrigateUser -Credential $cred -Role viewer
```

Creates a new Frigate user with the supplied credentials and assigns the `viewer` role.

## PARAMETERS

### -Credential
A `PSCredential` object containing the username and password for the new account. Use `Get-Credential` to create this object interactively.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Role
The role to assign to the new user. Valid values are `admin` or `viewer`. Defaults to `viewer`.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: admin, viewer

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
Position: 2
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
