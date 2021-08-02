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

  static const int adventuresInBlue = 0xFF2196F3;

  static const int flutterDarkBlue = 0xFF04599C;
  static const int flutterMiddleBlue = 0xFF30B8F6;
  static const int flutterLightBlue = 0xFF5EC8F8;

  static const int firebaseYellow = 0xFFFFCB2C;

  static const int primaryGrey = 0xFFAAAAAA;
  static const int secondaryGrey = 0xFF999999;

  static const int errorRed = 0xFF990000;

  static final standard = ThemeColors(
      primary: adventuresInBlue, secondary: firebaseYellow, error: errorRed);

  static final greyscale = ThemeColors(
      primary: primaryGrey, secondary: secondaryGrey, error: errorRed);
}
