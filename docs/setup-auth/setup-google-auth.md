# Setup Google Sign In

[< Setup Auth](../setup-auth.md)

Relevant links: [google_sign_in_web](https://pub.dev/packages/google_sign_in_web)

Go to the Firebase console and enable Google Sign In.

Go to [credentials page](https://console.cloud.google.com/apis/credentials) (make sure the correct project is selected) 
  - Under the "OAuth 2.0 Client IDs" section...
  - Find the "Web client (auto created by Google Service)"...
  - Tap "Copy OAuth client" button
    
Add a meta tag to the `head` section of `index.html`, of the form:

```sh
<meta name="google-signin-client_id" content="YOUR_GOOGLE_SIGN_IN_OAUTH_CLIENT_ID">
```

Set up the app’s OAuth consent screen in the Google Cloud Console https://console.developers.google.com/apis/credentials/consent?project=${your_project_number}

Add a launch configuration that uses port 5000:

```json
{
  "name": "web",
  "request": "launch",
  "type": "dart",
  "deviceId": "chrome",
  "args": ["--web-hostname", "localhost", "--web-port", "5000"]
},
```