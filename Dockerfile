FROM dart:2.15.1

# Copy Dart app source code.
COPY apps/dart/deploy_coverage/ /apps/dart/deploy_coverage/

# Build Dart app.
WORKDIR /apps/dart/deploy_coverage/
COPY pubspec.* .
RUN dart pub get
COPY . .
RUN dart pub get --offline
RUN dart compile exe /apps/dart/deploy_coverage/bin/deploy_coverage.dart -o /apps/dart/deploy_coverage/bin/deploy_coverage

FROM cirrusci/flutter:2.8.1
COPY --from=0 /apps/dart/deploy_coverage/bin/deploy_coverage /deploy_coverage
