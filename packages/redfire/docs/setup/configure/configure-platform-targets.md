# Configure platform targets

[< README]

After following the [FlutterFire Overview], ie. using the flutterfire cli to generate `lib/firebase_options.dart`, and following the [add-required-code] document, we just need to configure the relevant targets.

## iOS

Update `ios/Podfile` - change the `# platform :ios, '9.0'` line to `'10.0'`

Open `ios/Runner.xcodeproj` with XCode and increase deployment target to 10.0:

<img width="920" alt="Screen Shot 2021-12-02 at 3 52 16 pm" src="https://user-images.githubusercontent.com/1059276/144367276-6b2a678f-fbb4-400d-b78b-419c469cfacc.png">

## MacOS

1. Update `macos/Podfile` - change the `platform :osx, '10.11'` line to `10.12`.

1. Open `macos/Runner.xcodeproj` with Xcode and...

Under the 'Runner' target, Signing & Capabilites tab, check "Outgoing Connections (Client)"

<img width="664" alt="Screen Shot 2021-12-24 at 2 57 07 pm" src="https://user-images.githubusercontent.com/1059276/147315332-506c46a0-06af-4f9e-9d84-29d305fe7ff1.png">

Under the 'Runner' project Info tab set your Deployment Target to 10.12.

<img width="687" alt="Screen Shot 2021-12-24 at 2 58 18 pm" src="https://user-images.githubusercontent.com/1059276/147315337-e43aabf1-f976-4c0f-bd7e-d9a131197146.png">

## Android

- open `android/app/build.gradle`
- set the `minSdkVersion` to 21 (or enable multiDex)

## Web

Get the Web Client Id from the Firebase console: 
- Authentication -> Sign-in method -> Google -> Web SDK Configuration

<img width="1227" alt="Screen Shot 2021-12-24 at 3 23 40 pm" src="https://user-images.githubusercontent.com/1059276/147316233-88dd3b1a-1ab5-42e6-926e-5106d4be3349.png">

And add the key to `lib/redfire_options.dart`:

```Dart
static RedFireConfig web = RedFireConfig(
  firebase: DefaultFirebaseOptions.currentPlatform,
  auth: const AuthOptions(clientId: 'key goes here'),
);
```

## (Optionally) Improve Firestore build times on iOS & macOS

If choosing to [Improve iOS & macOS Build times] update the Podfile with:

```rb
# Override Firebase SDK Version
$FirebaseSDKVersion = '8.9.0'

...

pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '8.9.0'
```

## References

<details>
<summary>If you need to you can still use the old, manual style of configuring Firebase</summary>
<br>

Just don't pass a `RedFireOptions` to the `AppWidget` and perform the manual installation described in the FLutterFire docs:

- [iOS Installation]
- [MacOS Installation]
- [Android Installation]
- [Web Installation]

</details>

The Firebase Documentation: [Add Firebase to your Apple project](https://firebase.google.com/docs/ios/setup) describes the minimal requirements, eg. the project must target: iOS 10, macOS 10.12, etc.

[< README]: ../../../README.md
[FlutterFire Overview]: https://firebase.flutter.dev/docs/overview
[add-required-code]: ../add-required-code.md
[iOS Installation]: https://firebase.flutter.dev/docs/manual-installation/ios
[Improve iOS & macOS Build times]: https://firebase.flutter.dev/docs/firestore/overview/#4-optional-improve-ios--macos-build-times
[MacOS Installation]: https://firebase.flutter.dev/docs/manual-installation/macos
[Android Installation]: https://firebase.flutter.dev/docs/manual-installation/android
[Web App]: configure-firebase/create-web-app.md
[Entitlement]: https://docs.flutter.dev/desktop#setting-up-entitlements
[Web Installation]: https://firebase.flutter.dev/docs/manual-installation/web
