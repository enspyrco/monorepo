import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/settings/enums/platform_enum.dart';
import 'package:redfire/types.dart';

part 'auth_page_v_m.freezed.dart';
part 'auth_page_v_m.g.dart';

@freezed
class AuthPageVM with _$AuthPageVM, ReduxModel {
  factory AuthPageVM(PlatformsEnum platform, AuthState auth) = _AuthPageVM;

  factory AuthPageVM.fromJson(JsonMap json) => _$AuthPageVMFromJson(json);
}
