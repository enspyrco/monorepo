import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'other_auth_options_page_model.freezed.dart';
part 'other_auth_options_page_model.g.dart';

@freezed
class OtherAuthOptionsPageModel with _$OtherAuthOptionsPageModel, ReduxModel {
  const factory OtherAuthOptionsPageModel(AuthState auth) =
      _OtherAuthOptionsPageModel;

  factory OtherAuthOptionsPageModel.fromJson(JsonMap json) =>
      _$OtherAuthOptionsPageModelFromJson(json);
}
