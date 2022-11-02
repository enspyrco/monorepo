# adventuverse

This project

- holds the firebase config data for firebase project `the-adventuverse` which is used by
  - adventure_maker
  - the_process
  - ...
- ...

## Updating firebase config

### Firestore

Deploy `firestore.rules` after making changes:

```sh
firebase deploy --only firestore:rules
```
