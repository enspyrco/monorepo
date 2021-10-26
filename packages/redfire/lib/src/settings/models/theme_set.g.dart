// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThemeSet _$$_ThemeSetFromJson(Map<String, dynamic> json) => _$_ThemeSet(
      colors: ThemeColors.fromJson(json['colors'] as Map<String, dynamic>),
      brightness: $enumDecode(_$ThemeBrightnessEnumEnumMap, json['brightness']),
    );

Map<String, dynamic> _$$_ThemeSetToJson(_$_ThemeSet instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'brightness': _$ThemeBrightnessEnumEnumMap[instance.brightness],
    };

const _$ThemeBrightnessEnumEnumMap = {
  ThemeBrightnessEnum.light: 'LIGHT',
  ThemeBrightnessEnum.dark: 'DARK',
};
