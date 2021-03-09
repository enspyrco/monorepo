import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/models/problems/problem.dart';

part 'page_data.freezed.dart';
part 'page_data.g.dart';

@freezed
class PageData with _$PageData {
  const factory PageData.initial() = InitialPageData;
  const factory PageData.profile() = ProfilePageData;
  const factory PageData.problem(Problem problem) = ProblemPageData;

  factory PageData.fromJson(Map<String, dynamic> json) =>
      _$PageDataFromJson(json);
}
