import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/navigation/models/page_data.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'initial_page_data.freezed.dart';
part 'initial_page_data.g.dart';

@freezed
class InitialPageData extends PageData with _$InitialPageData {
  static String staticTypeName = 'InitialPageData';

  InitialPageData._();
  factory InitialPageData() = _InitialPageData;

  factory InitialPageData.fromJson(JsonMap json) =>
      _$InitialPageDataFromJson(json);

  @override
  String get typeName => staticTypeName;
}
