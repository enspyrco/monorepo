import 'package:flutter/widgets.dart';

/// ViewModel class for the [MissionHistoryItem] widget
class MissionHistoryItemViewModel {
  final bool isSelected;
  final List<Widget>? lineageShapes;

  MissionHistoryItemViewModel(this.isSelected, this.lineageShapes);
}
