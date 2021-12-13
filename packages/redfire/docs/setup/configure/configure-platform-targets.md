# Configure platform targets

[< README]

## iOS

Follow [iOS Installation]

1. Open iOS target with XCode and "Add files to Runner", then select "Copy files" and select `GoogleServices.info`. Also increase deployment target to 10.0:

<img width="920" alt="Screen Shot 2021-12-02 at 3 52 16 pm" src="https://user-images.githubusercontent.com/1059276/144367276-6b2a678f-fbb4-400d-b78b-419c469cfacc.png">

2. Update Podfile:
    - update the `# platform :ios, '9.0'` line to `'10.0'`

## MacOS

Follow [MacOS Installation]

1. Open `macos/Runner.xcodeproj` (with Xcode)

    - Right click Runner targer and select "Add files to Runner"
      - select "Copy files" and select `GoogleServices.info`
    - Ander the 'Runner' target General tab set your Deployment Target to 10.12.
    - Check "Outgoing Connections (Client)"
      <img width="243" alt="Screen Shot 2021-06-11 at 8 06 45 pm" src="https://user-images.githubusercontent.com/1059276/121673783-9d9bda80-caf4-11eb-8c99-6cd0e3726ce1.png">
        - ALternatively, add the `com.apple.security.network.client` [Entitlement] to `macos/Runner/DebugProfile.entitlements`

2. Edit the Podfile

    - Update the `platform :osx, '10.11'` line in your macOS/Podfile to version `10.12`.

## Android

Follow [Android Installation]

- add `google-services.json` to `android/app/`
- add the 'google-services' plugin dependency to `android/build.gradle`
- add `apply plugin: 'com.google.gms.google-services'` to `android/app/build.gradle`, under the line `apply plugin: 'com.android.application'`
- increase the `minSdkVersion` to 21 (or enable multiDex)

## Web

Follow [Web Installation], and import required JS SDKs:

```js
<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-firestore.js"></script>
```

## Optional improvements

### iOS & macOS

<details>
<summary>Improve Firestore build times</summary>
<br>

If choosing to [Improve iOS & macOS Build times] update the Podfile with:

```rb
# Override Firebase SDK Version
$FirebaseSDKVersion = '8.9.0'

...

pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '8.9.0'
```

</details>

### Web Local Dev

<details>
<summary>Avoid commiting Firebase credentials</summary>
<br>

- temporarily move `index.html` out of the project, *then add to gitignore & commit*
- move `index.html` back (with the CDN version of the Firebase config details, for local dev)
- add a file called `index.auto` with the autoimport versions, by following [Load Firebase SDKs from reserved URLs]

</details>

## References

From Firebase Documentation: [Add Firebase to your Apple project](https://firebase.google.com/docs/ios/setup) - your project must target these platform versions or later:

- iOS 10
- macOS 10.12

[< README]: ../../../README.md
[iOS Installation]: https://firebase.flutter.dev/docs/manual-installation/ios
[Improve iOS & macOS Build times]: https://firebase.flutter.dev/docs/firestore/overview/#4-optional-improve-ios--macos-build-times
[MacOS Installation]: https://firebase.flutter.dev/docs/manual-installation/macos
[Android Installation]: https://firebase.flutter.dev/docs/manual-installation/android
[Web App]: configure-firebase/create-web-app.md
[Entitlement]: https://docs.flutter.dev/desktop#setting-up-entitlements
[Web Installation]: https://firebase.flutter.dev/docs/manual-installation/web
[Load Firebase SDKs from reserved URLs]: https://firebase.google.com/docs/hosting/reserved-urls
