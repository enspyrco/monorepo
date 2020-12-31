library theme_colors;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/serializers.dart';

part 'theme_colors.g.dart';

abstract class ThemeColors implements Built<ThemeColors, ThemeColorsBuilder> {
  // colors

  static const int adventures_in_blue = 0xFF2196F3;

  static const int flutter_dark_blue = 0xFF04599C;
  static const int flutter_middle_blue = 0xFF30B8F6;
  static const int flutter_light_blue = 0xFF5EC8F8;

  static const int firebase_yellow = 0xFFFFCB2C;

  static const int primary_grey = 0xFFAAAAAA;
  static const int secondary_grey = 0xFF999999;

  static const int error_red = 0xFF990000;

  // members

  int get primary;
  int get secondary;
  int get error;

  ThemeColors._();

  // factory ThemeColors([void Function(ThemeColorsBuilder) updates]) =
  //     _$ThemeColors;

  factory ThemeColors(
      {required int primary,
      required int secondary,
      required int error}) = _$ThemeColors._;

  static final standard = ThemeColors(
      primary: adventures_in_blue,
      secondary: firebase_yellow,
      error: error_red);

  static final greyscale = ThemeColors(
      primary: primary_grey, secondary: secondary_grey, error: error_red);

  Object toJson() => serializers.serializeWith(ThemeColors.serializer, this);

  // static ThemeColors fromJson(String jsonString) => serializers.deserializeWith(
  //     ThemeColors.serializer, json.decode(jsonString));

  static Serializer<ThemeColors> get serializer => _$themeColorsSerializer;
}
