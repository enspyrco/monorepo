import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

class DispatchEvents extends ChangeNotifier {
  // Internal state.
  final List<Map<String, dynamic>> _events = [];
  int? _selectedIndex;

  // Getters for reading state.
  UnmodifiableListView<JsonMap> get events => UnmodifiableListView(_events);
  int? get selectedIndex => _selectedIndex;
  JsonMap get selectedState =>
      (_selectedIndex == null) ? {} : _events[_selectedIndex!]['state'];
  Map<String, dynamic> get previousState =>
      (_selectedIndex == null || _selectedIndex == 0)
          ? {}
          : _events[_selectedIndex! - 1]['state'];

  void setSelected(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void add(JsonMap event) {
    _events.add(event);
    notifyListeners();
  }

  void removeAll() {
    _events.clear();
    notifyListeners();
  }
}
