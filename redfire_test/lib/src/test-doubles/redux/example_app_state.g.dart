// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExampleAppState _$$_ExampleAppStateFromJson(Map<String, dynamic> json) =>
    _$_ExampleAppState(
      pages: IList.fromJson(
          json['pages'],
          (value) => const PageDataConverter()
              .fromJson(value as Map<String, Object?>)),
      problems: IList.fromJson(json['problems'],
          (value) => ProblemInfo.fromJson(value as Map<String, dynamic>)),
      settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
      auth: AuthState.fromJson(json['auth'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : ProfileData.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ExampleAppStateToJson(_$_ExampleAppState instance) =>
    <String, dynamic>{
      'pages': instance.pages.toJson(
        (value) => const PageDataConverter().toJson(value),
      ),
      'problems': instance.problems.toJson(
        (value) => value,
      ),
      'settings': instance.settings,
      'auth': instance.auth,
      'profile': instance.profile,
    };
