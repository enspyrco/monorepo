import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/navigation/models/page_data.dart';
import 'package:redfire/src/problems/models/problem_info.dart';

part 'problem_page_data.freezed.dart';
part 'problem_page_data.g.dart';

@freezed
class ProblemPageData extends PageData with _$ProblemPageData {
  factory ProblemPageData(ProblemInfo problem) = _ProblemPageData;

  factory ProblemPageData.fromJson(Map<String, Object?> json) =>
      _$ProblemPageDataFromJson(json);
}
