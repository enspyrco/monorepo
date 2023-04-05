FROM dart:2.19

# Resolve app dependencies & copy app source code (except anything in .dockerignore).
WORKDIR /app
COPY . .
RUN dart pub get

# Start server.
EXPOSE 8080
ENTRYPOINT ["/usr/lib/dart/bin/dart", "/app/bin/server.dart"]
