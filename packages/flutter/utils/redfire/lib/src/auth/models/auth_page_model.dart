import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../../types.dart';
import '../../settings/enums/platform_enum.dart';

part 'auth_page_model.freezed.dart';
part 'auth_page_model.g.dart';

@freezed
class AuthPageModel with _$AuthPageModel, ReduxState {
  static const String className = 'AuthPageModel';

  const AuthPageModel._();
  factory AuthPageModel(PlatformsEnum platform, AuthState auth) = _AuthPageVM;

  factory AuthPageModel.fromJson(JsonMap json) => _$AuthPageModelFromJson(json);

  @override
  String get typeName => className;
}
