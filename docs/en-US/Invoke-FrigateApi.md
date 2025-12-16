---
external help file: joshooaj.frigate-help.xml
Module Name: joshooaj.frigate
online version:
schema: 2.0.0
---

# Invoke-FrigateApi

## SYNOPSIS
Send a low-level API request to a Frigate server.

## SYNTAX

```
Invoke-FrigateApi [[-Session] <Object>] [-Path] <String> [[-Method] <String>] [[-Body] <IDictionary>]
 [[-Query] <IDictionary>] [<CommonParameters>]
```

## DESCRIPTION
Perform an arbitrary HTTP request against the Frigate API. This cmdlet is useful for administrators who need to call endpoints not supported by the module yet.

Provide `-Path` for the API endpoint and optionally `-Method` (default `Get`), a `-Query` dictionary for query parameters, or a `-Body` dictionary for JSON payloads.

## EXAMPLES

### Example 1

```powershell
Invoke-FrigateApi -Path 'api/stats'
```

Requests server performance stats from the Frigate instance.

### Example 2

```powershell
Invoke-FrigateApi -Path 'api/events' -Query @{ camera = 'frontdoor'; after = ([datetimeoffset]::UtcNow.AddHours(-1).ToUnixTimeMilliseconds() / 1000) }
```

Queries recent events from the `frontdoor` camera in the last hour.

### Example 3

```powershell
Invoke-FrigateApi -Path 'api/users' -Method Post -Body @{ username = 'newuser'; password = 'secret' }
```

Creates a new user via the API. Avoid passing plaintext secrets in shared scripts; prefer using secure credential helpers.

## PARAMETERS

### -Body
A dictionary (key/value) that will be JSON-encoded and sent as the request body. Use this for `POST` or `PUT` requests.

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Method
The HTTP method to use for the request (for example `Get`, `Post`, `Put`, `Delete`). Defaults to `Get`.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The API path to call (for example `api/events`, `api/users`). Do not include a leading slash; the module will normalize the path.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Query
A dictionary of query parameters to append to the request URL. Keys and values will be URL-encoded.

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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
