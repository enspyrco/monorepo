#!/bin/sh
 
echo "Retrieving credential files..."

gsutil cp gs://the-process-tool-credentials/GoogleService-Info.plist ./ios/Runner/GoogleService-Info.plist
gsutil cp gs://the-process-tool-credentials/GoogleService-Info.plist ./macos/Runner/GoogleService-Info.plist
gsutil cp gs://the-process-tool-credentials/google-services.json ./android/app/google-services.json
gsutil cp gs://the-process-tool-credentials/project_credentials.json ./functions/src/project_credentials.json
gsutil cp gs://the-process-tool-credentials/index.html ./web/index.html