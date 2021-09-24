# Common Tasks

## Deploy web target

- change web/index.html --> web/index_cdn.html
- change web/index_auto.html --> web/index.html

```sh
flutter build web
firebase deploy --only hosting
```

(if required) 
```sh
firebase deploy --only functions
```
