################
FROM dart:stable AS build

WORKDIR /app
COPY pubspec.yaml /app/pubspec.yaml
RUN dart pub get
COPY . .
RUN dart pub get --offline

RUN dart run build_runner build --delete-conflicting-outputs
RUN dart compile exe bin/server.dart -o bin/server

########################
FROM scratch
COPY --from=0 /app/bin/server /app/bin/server
EXPOSE 8080
ENTRYPOINT ["/app/bin/server"]
