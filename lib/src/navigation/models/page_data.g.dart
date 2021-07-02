// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialPageData _$_$InitialPageDataFromJson(Map<String, dynamic> json) {
  return _$InitialPageData();
}

Map<String, dynamic> _$_$InitialPageDataToJson(_$InitialPageData instance) =>
    <String, dynamic>{};

_$ProfilePageData _$_$ProfilePageDataFromJson(Map<String, dynamic> json) {
  return _$ProfilePageData();
}

Map<String, dynamic> _$_$ProfilePageDataToJson(_$ProfilePageData instance) =>
    <String, dynamic>{};

_$ProblemPageData _$_$ProblemPageDataFromJson(Map<String, dynamic> json) {
  return _$ProblemPageData(
    ProblemInfo.fromJson(json['problem'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$ProblemPageDataToJson(_$ProblemPageData instance) =>
    <String, dynamic>{
      'problem': instance.problem,
    };
