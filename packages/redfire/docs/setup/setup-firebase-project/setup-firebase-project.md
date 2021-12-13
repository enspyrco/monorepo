# Setup your Firebase project

[< README]

Before you begin ensure you have:

1. From the [Firebase console], create a firebase project and (depending on the platforms you are targeting), added:
    1. an "iOS App" if you plan to deploy to macOS and/or iOS
    2. an "Android App" if you plan to deploy to Android
    3. a "[Web App]" if you plan to deploy to web
1. Add relevant auth options
    - Select "Authentication"
    - Hit "Get Started"
    - Select Apple -> Enable -> Save
    - Select Google -> Enable
        - Update public-facing name
        - Add Project support email
        - Hit Save
1. Setup relevant Firebase Databases
    - Firestore
    - RTDB
1. (optional) [Update the project to the Blaze plan] - needed for:
    - using Google APIs
    - ...

[< README]: ../../../README.md
[Firebase console]: https://console.firebase.google.com/
[Update the project to the Blaze plan]: ./update-to-blaze.md
