import 'package:the_process/enums/navigation/nav_bar_selection.dart';

extension intExt on int {
  toNavBarSelection() {
    switch (this) {
      case 0:
        return NavBarSelection.sections;
      case 1:
        return NavBarSelection.topics;
      default:
        throw ArgumentError(this);
    }
  }
}
