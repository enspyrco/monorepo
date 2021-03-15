import 'package:flireator/enums/themes/brightness_mode.dart';

extension BrightnessModeExtension on BrightnessMode {
  bool get isLight => this == BrightnessMode.light;
  bool get isDark => this == BrightnessMode.dark;
}
