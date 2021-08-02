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
- also import the firebase-auth & firebase-firestore JS SDKs: 
  - `<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-auth.js"></script>`
  - `<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-firestore.js"></script>`

#### Local dev without commiting Firebase credentials

- temporarily move `index.html` out of the project, *then add to gitignore & commit*
- move `index.html` back (with the CDN version of the Firebase config details, for local dev)
- add a file called `index.auto` with the autoimport versions 
- go to Settings: https://console.firebase.google.com/project/<project_name>/settings/general 
- under "SDK setup and configuration" 
- select the "Automatic" radio button
- copy the contents to `index.auto`
