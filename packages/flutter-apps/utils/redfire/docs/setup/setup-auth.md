# Setup Auth

[< README](../../README.md)

## Setup Apple Sign In

- Follow: [apple-sign-in-flutter-firebase]

## Setup Google Sign In

Relevant links: [google_sign_in_web]

Go to [credentials page] (make sure the correct project is selected)

- Under the "OAuth 2.0 Client IDs" section...
- Find the "Web client (auto created by Google Service)"...
- Tap "Copy OAuth client" button

Add a meta tag to the `head` section of `index.html`, of the form:

```sh
<meta name="google-signin-client_id" content="YOUR_GOOGLE_SIGN_IN_OAUTH_CLIENT_ID">
```

Set up the app’s OAuth consent screen in the Google Cloud Console

`https://console.developers.google.com/apis/credentials/consent?project=${your_project_number}`

[apple-sign-in-flutter-firebase]: https://github.com/nickmeinhold/apple-sign-in-flutter-firebase
[google_sign_in_web]: https://pub.dev/packages/google_sign_in_web
[credentials page]: https://console.cloud.google.com/apis/credentials
