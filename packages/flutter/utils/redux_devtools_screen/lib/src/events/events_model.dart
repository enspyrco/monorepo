import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class EventsModel extends ChangeNotifier {
  // Internal state.
  final List<Map<String, dynamic>> _events = [];
  int? _selectedIndex;

  // Getters for reading state.
  UnmodifiableListView<Map<String, dynamic>> get events =>
      UnmodifiableListView(_events);
  int? get selectedIndex => _selectedIndex;
  Map<String, dynamic> get selectedState =>
      (_selectedIndex == null) ? {} : _events[_selectedIndex!]['state_json'];
  Map<String, dynamic> get previousState =>
      (_selectedIndex == null || _selectedIndex == 0)
          ? {}
          : _events[_selectedIndex! - 1]['state_json'];

  void setSelected(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void add(Map<String, dynamic> event) {
    _events.add(event);
    notifyListeners();
  }

  void removeAll() {
    _events.clear();
    notifyListeners();
  }
}
