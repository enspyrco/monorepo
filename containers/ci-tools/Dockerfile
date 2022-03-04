FROM ubuntu:bionic

RUN apt-get update && apt-get upgrade --yes
RUN apt-get install git curl unzip lcov --yes

# Install flutter tool (and the built-in Dart SDK)
RUN git clone https://github.com/flutter/flutter.git --depth 1 -b stable /_flutter/
ENV PATH="/_flutter/bin:${PATH}"
RUN flutter precache --linux

# Copy draw_badge Flutter app source code & get dependencies.
COPY ../../packages/flutter-apps/utils/ci-tools/draw_badge/ /apps/flutter/draw_badge/
WORKDIR /apps/flutter/draw_badge/
RUN flutter packages get

# Copy deploy_coverage Dart app source code, get dependencies & compile.
COPY ../../packages/cli-apps/ci-tools/deploy_coverage/ /apps/dart/deploy_coverage/
WORKDIR /apps/dart/deploy_coverage/
RUN dart pub get
RUN dart compile exe /apps/dart/deploy_coverage/bin/deploy_coverage.dart -o /deploy_coverage

# Start at the root
WORKDIR /