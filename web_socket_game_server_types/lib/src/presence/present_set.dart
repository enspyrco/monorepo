import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'present_set.freezed.dart';
part 'present_set.g.dart';

@freezed
class PresentSet with _$PresentSet {
  factory PresentSet(
      {@Default('present_set') String type,
      required ISet<String> ids}) = _PresentSet;

  factory PresentSet.fromJson(Map<String, Object?> json) =>
      _$PresentSetFromJson(json);
}
