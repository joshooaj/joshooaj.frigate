---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# New-FrigateSession

## SYNOPSIS
Create an authenticated session to a Frigate server.

## SYNTAX

```
New-FrigateSession [-Uri] <Uri> [-Credential] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
Authenticates to a Frigate server using the supplied URI and credentials, and returns a session object that you can use with other cmdlets in this module. The most recent session object is cached and used by default when the session parameter is not supplied.

## EXAMPLES

### Example 1
```powershell
$cred = Get-Credential -Message 'Frigate credentials'
New-FrigateSession -Uri 'https://frigate.example.local' -Credential $cred
```

Creates an authenticated session to the specified Frigate server and stores it for subsequent commands.

## PARAMETERS

### -Credential
A `PSCredential` containing the username and password used to authenticate to the Frigate server. Use `Get-Credential` to provide this interactively.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Uri
The base URI of the Frigate server (for example `https://frigate.example.local`). This must be a valid URI.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
