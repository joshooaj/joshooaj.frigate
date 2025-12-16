---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Get-FrigateProfile

## SYNOPSIS
Retrieves profile information from the Frigate server for the authenticated session.

## SYNTAX

```
Get-FrigateProfile [[-Session] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Returns profile details for the current authenticated user (as reported by the Frigate API). Typical information includes username and role.

## EXAMPLES

### Example 1

```powershell
Get-FrigateProfile | Format-Table username, role
```

Display the current profile information in a compact table.

### Example 2

```powershell
$session = New-FrigateSession -BaseUri 'https://frigate.example.local' -ApiKey $env:FRIGATE_API_KEY
$session | Get-FrigateProfile
```

This returns profile data from the specified Frigate server.

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

## OUTPUTS

## NOTES

This command queries the Frigate API `api/profile` endpoint and requires a valid authenticated session. If you receive an authentication error, run `New-FrigateSession` and try again.


Profiles may reveal user roles and accounts configured on the Frigate server - treat this data as sensitive.

## RELATED LINKS
