import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/problems/models/problem_info.dart';

part 'red_fire_page.freezed.dart';
part 'red_fire_page.g.dart';

@freezed
class RedFirePage with _$RedFirePage {
  const factory RedFirePage.initial() = RedFireInitialPage;
  // const factory RedFirePage.profile() = ProfilePage;
  const factory RedFirePage.problem(ProblemInfo info) = RedFireProblemPage;

  factory RedFirePage.fromJson(Map<String, Object?> json) =>
      _$RedFirePageFromJson(json);
}
