# Health
(*Health*)

## Overview

The _health_ endpoint provides a simple health check for the API. 

**Functionality:** Check the status of the API to ensure it is functioning
correctly.


### Available Operations

* [GetHealth](#gethealth) - Verify the status of the API

## GetHealth

Returns a 200 status code if the API is up and running.


### Example Usage

<!-- UsageSnippet language="csharp" operationID="getHealth" method="get" path="/rest/health" -->
```csharp
using DailyPay.SDK.DotNet9;
using DailyPay.SDK.DotNet9.Models.Components;

var sdk = new SDK(security: new Security() {
    OauthUserToken = "<YOUR_OAUTH_USER_TOKEN_HERE>",
});

var res = await sdk.Health.GetHealthAsync();

// handle response
```

### Response

**[GetHealthResponse](../../Models/Requests/GetHealthResponse.md)**

### Errors

| Error Type                                           | Status Code                                          | Content Type                                         |
| ---------------------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------- |
| DailyPay.SDK.DotNet9.Models.Errors.ErrorUnauthorized | 401                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet9.Models.Errors.ErrorUnexpected   | 500                                                  | application/vnd.api+json                             |
| DailyPay.SDK.DotNet9.Models.Errors.APIException      | 4XX, 5XX                                             | \*/\*                                                |