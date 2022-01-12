FROM ubuntu:bionic

RUN apt-get update && apt-get upgrade --yes
RUN apt-get install git curl unzip --yes

RUN git clone https://github.com/flutter/flutter.git --depth 1 -b beta /_flutter/
ENV PATH="/_flutter/bin:${PATH}"

RUN flutter doctor

# Copy Flutter app source code.
COPY apps/flutter/draw_badge/ /apps/flutter/draw_badge/

# Get depenencies.
WORKDIR /apps/flutter/draw_badge/
RUN flutter packages get

COPY apps/dart/deploy_coverage/ /apps/dart/deploy_coverage/
WORKDIR /apps/dart/deploy_coverage/
RUN dart pub get
RUN dart compile exe /apps/dart/deploy_coverage/bin/deploy_coverage.dart -o /apps/dart/deploy_coverage/bin/deploy_coverage
