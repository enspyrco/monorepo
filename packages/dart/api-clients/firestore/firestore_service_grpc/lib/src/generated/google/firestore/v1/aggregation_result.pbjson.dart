///
//  Generated code. Do not modify.
//  source: google/firestore/v1/aggregation_result.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use aggregationResultDescriptor instead')
const AggregationResult$json = const {
  '1': 'AggregationResult',
  '2': const [
    const {
      '1': 'aggregate_fields',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.google.firestore.v1.AggregationResult.AggregateFieldsEntry',
      '10': 'aggregateFields'
    },
  ],
  '3': const [AggregationResult_AggregateFieldsEntry$json],
};

@$core.Deprecated('Use aggregationResultDescriptor instead')
const AggregationResult_AggregateFieldsEntry$json = const {
  '1': 'AggregateFieldsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.firestore.v1.Value',
      '10': 'value'
    },
  ],
  '7': const {'7': true},
};

/// Descriptor for `AggregationResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aggregationResultDescriptor = $convert.base64Decode(
    'ChFBZ2dyZWdhdGlvblJlc3VsdBJmChBhZ2dyZWdhdGVfZmllbGRzGAIgAygLMjsuZ29vZ2xlLmZpcmVzdG9yZS52MS5BZ2dyZWdhdGlvblJlc3VsdC5BZ2dyZWdhdGVGaWVsZHNFbnRyeVIPYWdncmVnYXRlRmllbGRzGl4KFEFnZ3JlZ2F0ZUZpZWxkc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EjAKBXZhbHVlGAIgASgLMhouZ29vZ2xlLmZpcmVzdG9yZS52MS5WYWx1ZVIFdmFsdWU6AjgB');
