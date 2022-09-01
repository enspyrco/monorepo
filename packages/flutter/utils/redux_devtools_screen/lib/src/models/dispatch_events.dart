import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';
import 'package:redux_devtools_screen/src/enums/lineage_shape.dart';

class DispatchEvents extends ChangeNotifier {
  // Internal state.
  final List<Map<String, dynamic>> _events = [];
  int? _selectedIndex;
  final Map<int, int> _indexFor = {};
  final Map<int, LineageShape> _lineageFor = {};

  // Getters for reading state.
  UnmodifiableListView<JsonMap> get events => UnmodifiableListView(_events);
  int? get selectedIndex => _selectedIndex;
  JsonMap get selectedState =>
      (_selectedIndex == null) ? {} : _events[_selectedIndex!]['state'];
  Map<String, dynamic> get previousState =>
      (_selectedIndex == null || _selectedIndex == 0)
          ? {}
          : _events[_selectedIndex! - 1]['state'];
  Map<int, LineageShape> get lineageFor => UnmodifiableMapView(_lineageFor);

  void setSelected(int index) {
    _selectedIndex = index;

    identifyLineage();

    notifyListeners();
  }

  void add(JsonMap event) {
    var lastIndex = _events.length; // only valid b/c we add to the list next
    _events.add(event);

    // store the index of this event against it's id, so we can get parent index later
    var actionId = event['action']['id_'];
    _indexFor[actionId] = lastIndex;

    setSelected(lastIndex);
  }

  void removeAll() {
    _events.clear();
    notifyListeners();
  }

  void identifyLineage() {
    if (_selectedIndex == null) return;
    var selectedIndex = _selectedIndex!;

    // clear out the lineage data structure and add the endpoint
    _lineageFor.clear();
    _lineageFor[selectedIndex] = LineageShape.endpoint;

    // move to the next action
    var currentIndex = selectedIndex;
    var parentId = _events[currentIndex]['action']['parent_'];
    if (parentId == null) return;
    currentIndex = _indexFor[parentId]!;

    while (true) {
      parentId = _events[currentIndex]['action']['parent_'];

      if (parentId == null) {
        _lineageFor[currentIndex] = LineageShape.origin;
        break;
      }

      _lineageFor[currentIndex] = LineageShape.connection;

      currentIndex = _indexFor[parentId]!;
    }

    for (int i = selectedIndex; i != currentIndex; i--) {
      _lineageFor[i] ??= LineageShape.notConnection;
    }
  }
}
