import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/settings/enums/platform_enum.dart';
import 'package:redfire/types.dart';

part 'auth_page_model.freezed.dart';
part 'auth_page_model.g.dart';

@freezed
class AuthPageModel with _$AuthPageModel, ReduxModel {
  factory AuthPageModel(PlatformsEnum platform, AuthState auth) = _AuthPageVM;

  factory AuthPageModel.fromJson(JsonMap json) => _$AuthPageModelFromJson(json);
}
