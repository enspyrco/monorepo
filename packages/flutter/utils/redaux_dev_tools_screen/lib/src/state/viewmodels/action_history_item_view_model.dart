import 'package:flutter/widgets.dart';

/// ViewModel class for the [ActionHistoryItem] widget
class ActionHistoryItemViewModel {
  final bool isSelected;
  final List<Widget>? lineageShapes;

  ActionHistoryItemViewModel(this.isSelected, this.lineageShapes);
}
