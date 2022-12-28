#!/usr/bin/env bash

# Clone the googleapis & protobuf repos & change these lines to your local path.
GOOGLEAPIS=/Users/nick/git/orgs/google/googleapis
PROTOBUF=/Users/nick/git/orgs/google/protobuf

PROTOC="protoc --dart_out=grpc:lib/src/generated -I$PROTOBUF/src -I$GOOGLEAPIS"

# googleapis > firestore > v1

$PROTOC $GOOGLEAPIS/google/firestore/v1/aggregation_result.proto
$PROTOC $GOOGLEAPIS/google/firestore/v1/common.proto
$PROTOC $GOOGLEAPIS/google/firestore/v1/document.proto
$PROTOC $GOOGLEAPIS/google/firestore/v1/query.proto
$PROTOC $GOOGLEAPIS/google/firestore/v1/firestore.proto
$PROTOC $GOOGLEAPIS/google/firestore/v1/write.proto

# Firestore dependencies

$PROTOC $PROTOBUF/src/google/protobuf/struct.proto
$PROTOC $PROTOBUF/src/google/protobuf/wrappers.proto
$PROTOC $PROTOBUF/src/google/protobuf/any.proto
$PROTOC $PROTOBUF/src/google/protobuf/empty.proto
$PROTOC $PROTOBUF/src/google/protobuf/timestamp.proto
$PROTOC $GOOGLEAPIS/google/type/latlng.proto
$PROTOC $GOOGLEAPIS/google/rpc/status.proto

dart format lib/src/generated
