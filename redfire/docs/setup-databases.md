# Setup Databases

[< README](../README.md)

### iOS

In the Podfile

- change: `# platform :ios, '9.0'`
- to: `platform :ios, '10.0'`
- and if choosing to "Improve iOS Build times", add

```
# Override Firebase SDK Version
$FirebaseSDKVersion = '8.5.0'
```

Also, if desired follow [Improve iOS Buld times](https://firebase.flutter.dev/docs/overview#improve-ios-build-times)

- and add `pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '8.5.0'`

### macOS

If not already done, follow the [FlutterFire Docs for MacOS](https://firebase.flutter.dev/docs/installation/macos)

Also change the deployment target if required:

> The FlutterFire plugin cloud_firestore for macOS requires a macOS deployment target of 10.12 or later.

- Update the `platform :osx, '10.11'` line in your macOS/Podfile to version `10.12` and ensure you commit this file.
- Open your `macos/Runner.xcodeproj` Xcode project and under the 'Runner' target General tab set your Deployment Target to 10.12 or later.


If desired we can follow [Improve iOS Buld times](https://firebase.flutter.dev/docs/overview#improve-ios-build-times)

- and add `pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '8.5.0'`

I think (?) we can add the same line as we do for ios, see [this comment](https://github.com/FirebaseExtended/flutterfire/issues/2751#issuecomment-761557158) for some more info.

- and if choosing to "Improve Build times", as in iOS, add

```
# Override Firebase SDK Version
$FirebaseSDKVersion = '8.5.0'
```