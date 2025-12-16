---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Set-FrigateUser

## SYNOPSIS
Update an existing Frigate user's password and/or role.

## SYNTAX

```
Set-FrigateUser [[-Session] <Object>] [-Username] <String> [[-Password] <SecureString>] [[-Role] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Modify a user's account on a Frigate server. You can update the user's password and/or change their role (for example `admin` or `viewer`). The cmdlet requires the target `-Username` and accepts a secure password and role when you need to change them.

## EXAMPLES

### Example 1

```powershell
$pass = Read-Host -AsSecureString -Prompt 'New password for alice'
Set-FrigateUser -Username alice -Password $pass
```

Updates the password for the user `alice`. The secure string prevents the password from appearing in plain text.

## PARAMETERS

### -Password

The new password for the user as a `SecureString`. Use `Read-Host -AsSecureString` to prompt for a password without echoing it.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Role

The role to assign to the user. Valid values are `admin` or `viewer`. When provided, the user's role will be updated.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: admin, viewer

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

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

### -Username

The username of the account to modify. This value is required.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

### System.String

### System.Security.SecureString

## OUTPUTS

### None

## NOTES

This cmdlet performs account management operations on the Frigate server and typically requires administrative privileges. Passwords should be provided as `SecureString` values to avoid exposing secrets in logs or console history.

## RELATED LINKS
