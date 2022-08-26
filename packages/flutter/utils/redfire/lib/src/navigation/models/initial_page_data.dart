import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import 'page_data.dart';

part 'initial_page_data.freezed.dart';
part 'initial_page_data.g.dart';

@freezed
class InitialPageData extends PageData with _$InitialPageData {
  static const String className = 'InitialPageData';

  const InitialPageData._();
  const factory InitialPageData() = _InitialPageData;

  factory InitialPageData.fromJson(JsonMap json) =>
      _$InitialPageDataFromJson(json);

  @override
  String get typeName => className;
}
