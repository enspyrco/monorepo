import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'adventures_state.freezed.dart';
part 'adventures_state.g.dart';

@freezed
class AdventuresState with _$AdventuresState, ReduxModel {
  const factory AdventuresState(
      ISet<AdventureModel> list, AdventureModel? selected) = _AdventuresState;

  factory AdventuresState.fromJson(JsonMap json) =>
      _$AdventuresStateFromJson(json);

  factory AdventuresState.init() => AdventuresState(ISet(), null);
}
