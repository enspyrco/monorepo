import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'problem_page_data.freezed.dart';
part 'problem_page_data.g.dart';

@freezed
class ProblemPageData extends PageData with _$ProblemPageData, ReduxModel {
  static const String staticTypeName = 'ProblemPageData';

  const ProblemPageData._();
  const factory ProblemPageData(ProblemInfo problem) = _ProblemPageData;

  factory ProblemPageData.fromJson(JsonMap json) =>
      _$ProblemPageDataFromJson(json);

  @override
  String get typeName => staticTypeName;
}
