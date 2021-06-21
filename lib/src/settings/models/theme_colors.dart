import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_colors.freezed.dart';
part 'theme_colors.g.dart';

@freezed
class ThemeColors with _$ThemeColors {
  factory ThemeColors({
    required int primary,
    required int secondary,
    required int error,
  }) = _ThemeColors;

  factory ThemeColors.fromJson(Map<String, dynamic> json) =>
      _$ThemeColorsFromJson(json);

  // colors

  static const int adventures_in_blue = 0xFF2196F3;

  static const int flutter_dark_blue = 0xFF04599C;
  static const int flutter_middle_blue = 0xFF30B8F6;
  static const int flutter_light_blue = 0xFF5EC8F8;

  static const int firebase_yellow = 0xFFFFCB2C;

  static const int primary_grey = 0xFFAAAAAA;
  static const int secondary_grey = 0xFF999999;

  static const int error_red = 0xFF990000;

  static final standard = ThemeColors(
      primary: adventures_in_blue,
      secondary: firebase_yellow,
      error: error_red);

  static final greyscale = ThemeColors(
      primary: primary_grey, secondary: secondary_grey, error: error_red);
}
