import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

part 'problem_info.freezed.dart';
part 'problem_info.g.dart';

@freezed
class ProblemInfo with _$ProblemInfo {
  factory ProblemInfo(String message, [String? trace]) = _ProblemInfo;

  factory ProblemInfo.fromJson(JsonMap json) => _$ProblemInfoFromJson(json);
}
