import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem_info.freezed.dart';
part 'problem_info.g.dart';

@freezed
class ProblemInfo with _$ProblemInfo {
  factory ProblemInfo(String message, [String? trace]) = _ProblemInfo;

  factory ProblemInfo.fromJson(Map<String, Object?> json) =>
      _$ProblemInfoFromJson(json);
}
