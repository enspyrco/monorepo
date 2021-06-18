# Update platform settings

[< README](../README.md)

### web 

Go to [Firebase console](https://console.firebase.google.com/) and:
1. Tap "Add App"
2. Select Web Platform 
3. Enter app nickname (eg. Web)
4. Check the box to setup Firebase hosting (if desired)
5. Keep clicking Next, then Return to console

Follow [FlutterFire > Web Installation](https://firebase.flutter.dev/docs/installation/web)
- also, add the firebase-auth JS SDK: `<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-auth.js"></script>`

#### Local dev without commiting Firebase credentials

- move & gitignore `index.html`, *then commit* - so there is no index.html to confuse things 
- re-add `index.html` with the Firebase config details (so local dev works)
- add a file called `index.auto` with the autoimport versions 
- go to Settings: https://console.firebase.google.com/project/<project_name>/settings/general 
- under "SDK setup and configuration" 
- select the "Automatic" radio button
- copy the contents to `index.auto` 
- copy and rename `web/index.auto` to `web/index.html`, then replace:

```javascript
<script src="/__/firebase/8.6.1/firebase-app.js"></script>
<script src="/__/firebase/8.6.1/firebase-auth.js"></script>
<script src="/__/firebase/init.js"></script>
```
> with the javascript found by selecting the "CDN" radio button under the "SDK setup and configuration" section of the [project page](https://console.firebase.google.com/project)


#### CI for Firebase hosting 

- setup hosting -> Firease console -> Hosting -> Get Started 
- follow the prompts, including adding CI (use "flutter build web" for the predeploy script)
- edit the created .yml file to add the following lines after `- uses: actions/checkout@v2`:

```yml
# Setup flutter using the dev channel.
- name: Install Java for Flutter tool
  uses: actions/setup-java@v1
  with:
    java-version: '12.x'
- name: Install Flutter tool
  uses: subosito/flutter-action@v1
  with:
    channel: dev

# Get app dependencies, run code gen & run tests.
- run: flutter pub get
- run: flutter pub run build_runner build 
- run: flutter test

# Rename index.html and build for web.
- run: cp web/index.auto web/index.html
- run: flutter build web
```

> Note: currently the url for each deploy must be added to the "Authorized JavaScript origins" for the relevant OAuth2 Client Id at the [credentials page](https://console.cloud.google.com/apis/credentials)... we're searching for a better way

#### Google Sign In 

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

### macos 

Increase macos target  
- Update the `platform :osx, '10.11'` line in your macOS/Podfile to version `10.12` and ensure you commit this file.
- Open your `macos/Runner.xcodeproj` Xcode project and under the 'Runner' target General tab set your Deployment Target to 10.12 or later.
- Check "Outgoing Connections (Client)" 

<img width="243" alt="Screen Shot 2021-06-11 at 8 06 45 pm" src="https://user-images.githubusercontent.com/1059276/121673783-9d9bda80-caf4-11eb-8c99-6cd0e3726ce1.png">

Create a firebase project and ios app, then add: 
- GoogleServices.info to 
  - macos/Runner/ 
  - ios/…? 
- Android file … 

Add to `.gitignore`
```.gitignore
# Firebase config files
/macos/Runner/GoogleService-Info.plist
```

If you get stuck with a build error that mentions the Podfile, try:

```sh
flutter clean
pod repo update
cd macos
pod update
```



