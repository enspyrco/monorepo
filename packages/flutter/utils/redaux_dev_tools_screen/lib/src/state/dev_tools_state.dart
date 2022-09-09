import 'package:collection/collection.dart';
import 'package:json_types/json_types.dart';
import 'package:redaux/redaux.dart';

import '../enums/lineage_shape.dart';

/// The AppState for redaux, named differently as the [RedauxDevToolsScreen] is
/// for visualising the AppState of apps.
class DevToolsState extends RootState {
  DevToolsState(
      {List<ErrorMessage>? errorMessages,
      List<JsonMap>? dispatchEvents,
      int? selectedIndex,
      Map<int, LineageShape>? lineageForIndex,
      Map<int, int>? indexForActionId})
      : _dispatchEvents = dispatchEvents ?? [],
        _selectedIndex = selectedIndex,
        _lineageFor = lineageForIndex ?? {},
        _indexFor = indexForActionId ?? {};

  static DevToolsState get initial => DevToolsState();

  @override
  DevToolsState copyWith(
      {List<ErrorMessage>? errorMessages,
      List<JsonMap>? dispatchEvents,
      int? selectedIndex,
      Map<int, LineageShape>? lineageForIndex,
      Map<int, int>? indexForActionId}) {
    return DevToolsState(
        errorMessages: errorMessages ?? super.errorMessages,
        dispatchEvents: dispatchEvents ?? _dispatchEvents,
        selectedIndex: selectedIndex ?? _selectedIndex,
        indexForActionId: indexForActionId ?? _indexFor,
        lineageForIndex: lineageForIndex ?? _lineageFor);
  }

  @override
  JsonMap toJson() => {
        'dispatchEvents':
            (_dispatchEvents.isEmpty) ? {} : _dispatchEvents.first,
        'errorMessages': errorMessages,
        'selectedIndex': selectedIndex,
        'lineageForIndex': lineageFor,
        'indexForActionId': indexFor
      };

  /// The list of dispatch events, added to each time [Store.dispatch] is called
  final List<JsonMap> _dispatchEvents;

  /// [_selectedIndex] is a nullable int, as 'nothing selected' is a valid state
  final int? _selectedIndex;

  /// [_indexFor] maps a given action's id to it's index in the list
  final Map<int, int> _indexFor;

  /// [_lineageFor] maps an action's index in the list to the appropriate lineage
  /// shape, which is drawn as part part of the list item
  final Map<int, LineageShape> _lineageFor;

  /// If there are errors (eg. decoding invalid json) we save an error message
  /// that the screen will display
  // final List<ErrorMessage> _errorMessages = [];

  /// Getters for reading state.
  UnmodifiableListView<JsonMap> get dispatchEvents =>
      UnmodifiableListView(_dispatchEvents);
  int? get selectedIndex => _selectedIndex;
  JsonMap get selectedState =>
      (_selectedIndex == null) ? {} : _dispatchEvents[_selectedIndex!]['state'];
  Map<String, dynamic> get previousState =>
      (_selectedIndex == null || _selectedIndex == 0)
          ? {}
          : _dispatchEvents[_selectedIndex! - 1]['state'];
  Map<int, LineageShape> get lineageFor => UnmodifiableMapView(_lineageFor);
  Map<int, int> get indexFor => UnmodifiableMapView(_indexFor);

  /// [add] is used for adding a dispatch event to the list. The will also call
  /// [setSelected] on the new dispatch event.
  /// The incoming json is assumed to have the form:
  ///   - { action: {id_ : <id>, }
  // void addDispatchEvent(JsonMap event) {
  //   var lastIndex = _dispatchEvents.length; // valid b/c we next add to the list
  //   _dispatchEvents.add(event);

  //   // Store the index against the actionId, so we can later retrieve a
  //   // parent's index from it's actionId
  //   // JsonMap action =
  //   //     event['action'] ?? (throw 'added json has no `action` key');
  //   // int actionId = action['id_'] ?? (throw 'added json has no `id_` key');

  //   try {
  //     JsonMap action =
  //         event['action'] ?? (throw 'added json has no `action` key');
  //     int actionId = action['id_'] ?? (throw 'added json has no `id_` key');

  //     _indexFor[actionId] = lastIndex;

  //     setSelectedAction(lastIndex);
  //   } catch (error) {
  //     // _errorMessages.add(ErrorMessage('$error', '$trace'));
  //   }
  // }

  /// The [removeDispatchEvents] function is called when the app sends a `remove_all` event.
  void removeDispatchEvents() {
    _dispatchEvents.clear();
  }

  /// The [addErrorMessage] function is called within a `setState` to add an error
  /// message to the list and update the view to show the error details.
  // void addErrorMessage(ErrorMessage errorMessage) =>
  //     _errorMessages.add(errorMessage);

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
    var parentId = _dispatchEvents[currentIndex]['action']['parent_'];
    if (parentId == null) return;
    currentIndex = _indexFor[parentId]!;

    // Move to the parent and process the action until there is no parent
    while (true) {
      parentId = _dispatchEvents[currentIndex]['action']['parent_'];

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
