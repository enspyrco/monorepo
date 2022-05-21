FROM ubuntu:bionic

RUN apt-get update && apt-get upgrade --yes
RUN apt-get install git curl unzip lcov clang cmake ninja-build pkg-config libgtk-3-dev --yes

# Install flutter tool (and the built-in Dart SDK)
RUN git clone https://github.com/flutter/flutter.git --depth 1 -b stable /_flutter/
ENV PATH="/_flutter/bin:${PATH}"
RUN flutter precache --linux

# Start at the root
WORKDIR /