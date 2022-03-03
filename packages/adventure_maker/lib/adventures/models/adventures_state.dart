import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'adventure_model.dart';

part 'adventures_state.freezed.dart';
part 'adventures_state.g.dart';

@freezed
class AdventuresState with _$AdventuresState, ReduxState {
  static const String className = 'AdventuresState';

  const AdventuresState._();
  const factory AdventuresState(
      {AdventureModel? selected,
      required ISet<AdventureModel> all}) = _AdventuresState;

  factory AdventuresState.fromJson(JsonMap json) =>
      _$AdventuresStateFromJson(json);

  factory AdventuresState.init() => AdventuresState(all: ISet());

  @override
  String get typeName => className;
}
