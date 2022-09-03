import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

import '../enums/lineage_shape.dart';

class DispatchEvents extends ChangeNotifier {
  /// The list of dispatch events, added to each time [Store.dispatch] is called
  final List<Map<String, dynamic>> _events = [];

  /// [_selectedIndex] is a nullable int, as 'nothing selected' is a valid state
  int? _selectedIndex;

  /// [_indexFor] maps a given action's id to it's index in the list
  final Map<int, int> _indexFor = {};

  /// [_lineageFor] maps an action's index in the list to the appropriate lineage
  /// shape, which is drawn as part part of the list item
  final Map<int, LineageShape> _lineageFor = {};

  /// Getters for reading state.
  UnmodifiableListView<JsonMap> get events => UnmodifiableListView(_events);
  int? get selectedIndex => _selectedIndex;
  JsonMap get selectedState =>
      (_selectedIndex == null) ? {} : _events[_selectedIndex!]['state'];
  Map<String, dynamic> get previousState =>
      (_selectedIndex == null || _selectedIndex == 0)
          ? {}
          : _events[_selectedIndex! - 1]['state'];
  Map<int, LineageShape> get lineageFor => UnmodifiableMapView(_lineageFor);

  /// [setSelected] is used for selecting a list item and will also identify the
  /// appropriate lineage to be drawn and notify listeners.
  void setSelected(int index) {
    _selectedIndex = index;
    _identifyLineage();
    notifyListeners();
  }

  /// [add] is used for adding a dispatch event to the list. The will also call
  /// [setSelected] on the new dispatch event.
  void add(JsonMap event) {
    var lastIndex = _events.length; // valid b/c we add to the list next
    _events.add(event);

    // Store the index against the actionId, so we can later retrieve a
    // parent's index from it's actionId
    var actionId = event['action']['id_'];
    _indexFor[actionId] = lastIndex;

    setSelected(lastIndex);
  }

  /// [removeAll] Is used when the app sends a `remove_all` event.
  void removeAll() {
    _events.clear();
    notifyListeners();
  }

  /// [_identifyLineage] is used by [setSelected] to calculate how each list item
  /// is involved in the lineage. There are 5 possibilities - in between the `origin`
  /// and the `endpoint` the list items are either a `connection` (one of actions
  /// in the the lineage) or `notConnection` (not in the sequence). Any items beyond
  /// the origin have `null` and do not have and lineage drawn.
  void _identifyLineage() {
    if (_selectedIndex == null) return;
    var selectedIndex = _selectedIndex!;

    // Clear out the lineage data structure
    _lineageFor.clear();

    // Process the selected action
    _lineageFor[selectedIndex] = LineageShape.endpoint;
    var currentIndex = selectedIndex;
    var parentId = _events[currentIndex]['action']['parent_'];
    if (parentId == null) return;
    currentIndex = _indexFor[parentId]!;

    // Move to the parent and process the action until there is no parent
    while (true) {
      parentId = _events[currentIndex]['action']['parent_'];

      if (parentId == null) {
        _lineageFor[currentIndex] = LineageShape.origin;
        break;
      }

      _lineageFor[currentIndex] = LineageShape.connection;

      currentIndex = _indexFor[parentId]!;
    }

    // Iterate over the actions from origin to endpoint and update anything unset
    // to `notConnection`.
    for (int i = selectedIndex; i != currentIndex; i--) {
      _lineageFor[i] ??= LineageShape.notConnection;
    }
  }
}
