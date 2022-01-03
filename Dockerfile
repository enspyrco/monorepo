FROM dart:2.15.1

# Copy Dart app source code.
COPY apps/deploy_coverage/ /apps/deploy_coverage/

WORKDIR /apps/deploy_coverage/
COPY pubspec.* .
RUN dart pub get
COPY . .
RUN dart pub get --offline
RUN dart compile exe /apps/deploy_coverage/bin/deploy_coverage.dart -o /apps/deploy_coverage/bin/deploy_coverage

FROM dart:2.15.1
COPY --from=0 /apps/deploy_coverage/bin/deploy_coverage /deploy_coverage
