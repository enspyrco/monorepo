# Configure Firebase 

## Update platform settings

[< README](../README.md)

### Project config setup 

(optionally) [Update the project to the Blaze plan](./update-to-blaze.md) which is needed for
- using Google APIs
- ...

[Create a firebase project](https://console.firebase.google.com/)

- Create "iOS" app for macOS & iOS targets, then:
 - follow [iOS Installation](https://firebase.flutter.dev/docs/installation/ios) & [MacOS Installation](https://firebase.flutter.dev/docs/installation/macos):
   - open iOS target with XCode and "Add files to Runner", then select "Copy files" and select `GoogleServices.info`
   - open macos target and 
    - "Add files to Runner", select "Copy files" and select `GoogleServices.info`
    - add the `com.apple.security.network.client` [Entitlement](https://flutter.dev/desktop#setting-up-entitlements) to `macos/Runner/DebugProfile.entitlements`
    - ? update the deployment target to 10.12 (testing if we need this)

- Create "Android" app for Android target, then:
  - follow [Android Installation | FlutterFire](https://firebase.flutter.dev/docs/installation/android) and 
    - add `google-services.json` to `android/app/`
    - add the 'google-services' plugin dependency to `android/build.gradle`
    - add `apply plugin: 'com.google.gms.google-services'` to `android/app/build.gradle`, under the line `apply plugin: 'com.android.application'`
    - increase the `minSdkVersion` to 21 (or enable multiDex)

Add to `.gitignore`
```.gitignore
# Firebase config files
/ios/Runner/GoogleService-Info.plist
/macos/Runner/GoogleService-Info.plist
/android/app/google-services.json
/web/index.html
```

### web 

Go to [Firebase console](https://console.firebase.google.com/) and:
1. Tap "Add App"
2. Select Web Platform 
3. Enter app nickname (eg. Web)
4. Check the box to setup Firebase hosting (if desired)
5. Keep clicking Next, then Return to console

Follow [FlutterFire > Web Installation](https://firebase.flutter.dev/docs/installation/web)
- also import the firebase-auth & firebase-firestore JS SDKs: 
  - `<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-auth.js"></script>`
  - `<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-firestore.js"></script>`

#### Local dev without commiting Firebase credentials

- temporarily move `index.html` out of the project, *then add to gitignore & commit*
- move `index.html` back (with the CDN version of the Firebase config details, for local dev)
- add a file called `index.auto` with the autoimport versions, by following [Load Firebase SDKs from reserved URLs](https://firebase.google.com/docs/hosting/reserved-urls)
