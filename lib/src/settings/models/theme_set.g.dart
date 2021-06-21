// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThemeSet _$_$_ThemeSetFromJson(Map<String, dynamic> json) {
  return _$_ThemeSet(
    colors: ThemeColors.fromJson(json['colors'] as Map<String, dynamic>),
    brightness: _$enumDecode(_$ThemeBrightnessEnumEnumMap, json['brightness']),
  );
}

Map<String, dynamic> _$_$_ThemeSetToJson(_$_ThemeSet instance) =>
    <String, dynamic>{
      'colors': instance.colors.toJson(),
      'brightness': _$ThemeBrightnessEnumEnumMap[instance.brightness],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ThemeBrightnessEnumEnumMap = {
  ThemeBrightnessEnum.light: 'LIGHT',
  ThemeBrightnessEnum.dark: 'DARK',
};
