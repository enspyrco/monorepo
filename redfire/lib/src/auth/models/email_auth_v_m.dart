import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'email_auth_v_m.freezed.dart';
part 'email_auth_v_m.g.dart';

@freezed
class EmailAuthVM with _$EmailAuthVM, ReduxModel {
  factory EmailAuthVM({
    String? email,
    ISet<ProvidersEnum>? providers,
  }) = _EmailAuthVM;

  factory EmailAuthVM.fromJson(JsonMap json) => _$EmailAuthVMFromJson(json);
}
