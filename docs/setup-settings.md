# Fix platform settings

[< README](../README.md)

### macos 

Increase macos target  
- Update the `platform :osx, '10.11'` line in your macOS/Podfile to version `10.12` and ensure you commit this file.
- Open your `macos/Runner.xcodeproj` Xcode project and under the 'Runner' target General tab set your Deployment Target to 10.12 or later.

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
