# Setup CI/CD

[< README]

## CD for Firebase hosting

- setup hosting -> Firebase console -> Hosting -> Get Started
- follow the prompts, including adding CI
  - use "build/web" for the public directory
  - enter 'y' for "rewrite all urls to /index.html"
  - enter 'y' for "Set up automatic builds and deploys with GitHub?"
  - use "flutter build web" for the predeploy script
  - if there is an error: follow any Required Action prompts in the output
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

[< README]: ../../README.md
