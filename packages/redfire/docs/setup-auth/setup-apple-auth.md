# Setup Sign In with Apple

[< Setup Auth](../setup-auth.md)

### Configure Apple & Firebase

- Follow: [apple-sign-in-flutter-firebase](https://github.com/nickmeinhold/apple-sign-in-flutter-firebase)

### Configure MacOS app

Increase macos target (this is for Firestore?)
- Update the `platform :osx, '10.11'` line in your macOS/Podfile to version `10.12` and ensure you commit this file.
- Open your `macos/Runner.xcodeproj` Xcode project and under the 'Runner' target General tab set your Deployment Target to 10.12 or later.
- Check "Outgoing Connections (Client)" 

<img width="243" alt="Screen Shot 2021-06-11 at 8 06 45 pm" src="https://user-images.githubusercontent.com/1059276/121673783-9d9bda80-caf4-11eb-8c99-6cd0e3726ce1.png">

If you get stuck with a build error that mentions the Podfile, try:

```sh
flutter clean
pod repo update
cd macos
pod update
```