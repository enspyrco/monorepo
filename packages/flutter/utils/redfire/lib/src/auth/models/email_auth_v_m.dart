import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../types.dart';

part 'email_auth_v_m.freezed.dart';
part 'email_auth_v_m.g.dart';

@freezed
class EmailAuthVM with _$EmailAuthVM, ReduxState {
  static const String className = 'EmailAuthVM';

  const EmailAuthVM._();
  factory EmailAuthVM({
    String? email,
    ISet<ProvidersEnum>? providers,
  }) = _EmailAuthVM;

  factory EmailAuthVM.fromJson(JsonMap json) => _$EmailAuthVMFromJson(json);

  @override
  String get typeName => className;
}
