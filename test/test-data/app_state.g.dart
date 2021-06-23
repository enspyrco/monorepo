// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$_$_AppStateFromJson(Map<String, dynamic> json) {
  return _$_AppState(
    pages: IList.fromJson(json['pages'],
        (value) => RedFirePage.fromJson(value as Map<String, dynamic>)),
    problems: IList.fromJson(json['problems'],
        (value) => ProblemInfo.fromJson(value as Map<String, dynamic>)),
    settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
    auth: AuthState.fromJson(json['auth'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'pages': instance.pages.toJson(
        (value) => value,
      ),
      'problems': instance.problems.toJson(
        (value) => value,
      ),
      'settings': instance.settings,
      'auth': instance.auth,
    };
