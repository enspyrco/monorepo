# Using built-in services & pre-made UI

[< README]

<details>
<summary>Built-in services</summary>
<br>

- FlutterfireFirestoreService
  - .`tapIntoCollection` - adds the docId to the json as 'id'
  - if you add a `String? id` member to your Model, it will hold the docId
- AuthenticationService
- PlatformService

</details>

<details>
<summary>Pre-made UI</summary>
<br>

- auth page
- admin page

</details>

<details>
<summary>Prebuilt app features: (services + UI)</summary>
<br>

- authentication
- profile
- simplified database access
  - snippets make it easy to
    - create a middleware that uses the firestore service to read/watch docs/collections and save to AppState
    - easily create a widget that reacts to AppState

</details>

[< README]: ../../README.md
