import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../types.dart';

part 'other_auth_options_page_model.freezed.dart';
part 'other_auth_options_page_model.g.dart';

@freezed
class OtherAuthOptionsPageModel with _$OtherAuthOptionsPageModel, ReduxState {
  static const String className = 'OtherAuthOptionsPageModel';

  const OtherAuthOptionsPageModel._();
  const factory OtherAuthOptionsPageModel(AuthState auth) =
      _OtherAuthOptionsPageModel;

  factory OtherAuthOptionsPageModel.fromJson(JsonMap json) =>
      _$OtherAuthOptionsPageModelFromJson(json);

  @override
  String get typeName => className;
}
