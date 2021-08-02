# Setup CI/CD

[< README](../README.md)

#### CD for Firebase hosting

- setup hosting -> Firebase console -> Hosting -> Get Started 
- follow the prompts, including adding CI (use "flutter build web" for the predeploy script)
- edit the created .yml file to add the following lines after `- uses: actions/checkout@v2`:

```yml
# Setup flutter using the dev channel.
- name: Install Java for Flutter tool
  uses: actions/setup-java@v1
  with:
    java-version: '12.x'
- name: Install Flutter tool
  uses: subosito/flutter-action@v1
  with:
    channel: dev

# Get app dependencies, run code gen & run tests.
- run: flutter pub get
- run: flutter pub run build_runner build 
- run: flutter test

# Rename index.html and build for web.
- run: cp web/index.auto web/index.html
- run: flutter build web
```

> Note: currently the url for each deploy must be added to the "Authorized JavaScript origins" for the relevant OAuth2 Client Id at the [credentials page](https://console.cloud.google.com/apis/credentials)... we're searching for a better way