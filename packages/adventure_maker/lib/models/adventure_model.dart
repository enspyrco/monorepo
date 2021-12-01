import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'adventure_model.freezed.dart';
part 'adventure_model.g.dart';

@freezed
class AdventureModel with _$AdventureModel, ReduxModel {
  const factory AdventureModel({required String name}) = _AdventureModel;

  factory AdventureModel.fromJson(JsonMap json) =>
      _$AdventureModelFromJson(json);
}
