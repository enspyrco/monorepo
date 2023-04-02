# notion_api_client

*A Dart client for the Notion API.*

## Missing files

Add `example/credentials.dart` with:

```dart
const token = '...';
```

The token can be found at [My integrations | Notion Developers](https://www.notion.so/my-integrations).

## Http Status Codes & Error Messages

From the [Notion Docs](https://developers.notion.com/reference/status-codes):

Responses from the API use HTTP response codes are used to indicate general classes of success and error.

Error responses contain more detail about the error in the response body, in the "code" and "message" properties.

- `api_client_utils`

  - When an API request receives something other than 200, an `ApiException` is thrown
  - We call `getJsonValue` with key 'message' on the `ApiException` to get the error message

## Features

### Scrape Notion Docs for API Description

#### Http Status Messages

Run `bin/scrape_docs.dart` with the "Docs Scraper" launch config

- Output: `output/api-description/http_status_messages.json`

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
