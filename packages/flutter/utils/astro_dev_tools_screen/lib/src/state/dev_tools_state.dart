import 'package:astro/astro.dart';
import 'package:collection/collection.dart';
import 'package:json_types/json_types.dart';

import '../enums/lineage_shape.dart';

/// The AppState for astro, named differently as the [AstroDevToolsScreen] is
/// for visualising the AppState of apps.
class DevToolsState extends RootState {
  DevToolsState(
      {List<ErrorMessage>? errorMessages,
      List<JsonMap>? missionEvents,
      int? selectedIndex,
      Map<int, LineageShape>? lineageForIndex,
      Map<int, int>? indexForMissionId})
      : _missionEvents = missionEvents ?? [],
        _selectedIndex = selectedIndex,
        _lineageFor = lineageForIndex ?? {},
        _indexFor = indexForMissionId ?? {};

  static DevToolsState get initial => DevToolsState();

  @override
  DevToolsState copyWith(
      {List<ErrorMessage>? errorMessages,
      List<JsonMap>? missionEvents,
      int? selectedIndex,
      Map<int, LineageShape>? lineageForIndex,
      Map<int, int>? indexForMissionId}) {
    return DevToolsState(
        errorMessages: errorMessages ?? super.errorMessages,
        missionEvents: missionEvents ?? _missionEvents,
        selectedIndex: selectedIndex ?? _selectedIndex,
        indexForMissionId: indexForMissionId ?? _indexFor,
        lineageForIndex: lineageForIndex ?? _lineageFor);
  }

  @override
  JsonMap toJson() => {
        'missionEvents': (_missionEvents.isEmpty) ? {} : _missionEvents.first,
        'errorMessages': errorMessages,
        'selectedIndex': selectedIndex,
        'lineageForIndex': lineageFor,
        'indexForMissionId': indexFor
      };

  /// The list of mission events, added to each time [MissionControl.launch] or
  /// [MissionControl.land] is called
  final List<JsonMap> _missionEvents;

  /// [_selectedIndex] is a nullable int, as 'nothing selected' is a valid state
  final int? _selectedIndex;

  /// [_indexFor] maps a given mission's id to it's index in the list
  final Map<int, int> _indexFor;

  /// [_lineageFor] maps an mission's index in the list to the appropriate lineage
  /// shape, which is drawn as part part of the list item
  final Map<int, LineageShape> _lineageFor;

  /// If there are errors (eg. decoding invalid json) we save an error message
  /// that the screen will display
  // final List<ErrorMessage> _errorMessages = [];

  /// Getters for reading state.
  UnmodifiableListView<JsonMap> get missionEvents =>
      UnmodifiableListView(_missionEvents);
  int? get selectedIndex => _selectedIndex;
  JsonMap get selectedState =>
      (_selectedIndex == null) ? {} : _missionEvents[_selectedIndex!]['state'];
  Map<String, dynamic> get previousState =>
      (_selectedIndex == null || _selectedIndex == 0)
          ? {}
          : _missionEvents[_selectedIndex! - 1]['state'];
  Map<int, LineageShape> get lineageFor => UnmodifiableMapView(_lineageFor);
  Map<int, int> get indexFor => UnmodifiableMapView(_indexFor);

  /// The [removeMissionEvents] function is called when the app sends a `remove_all` event.
  void removeMissionEvents() {
    _missionEvents.clear();
  }

  /// The [addErrorMessage] function is called within a `setState` to add an error
  /// message to the list and update the view to show the error details.
  // void addErrorMessage(ErrorMessage errorMessage) =>
  //     _errorMessages.add(errorMessage);

  void _identifyLineage() {
    if (_selectedIndex == null) return;
    var selectedIndex = _selectedIndex!;

    // Clear out the lineage data structure
    _lineageFor.clear();

    // Process the selected mission
    _lineageFor[selectedIndex] = LineageShape.endpoint;
    var currentIndex = selectedIndex;
    var parentId = _missionEvents[currentIndex]['mission']['parent_'];
    if (parentId == null) return;
    currentIndex = _indexFor[parentId]!;

    // Move to the parent and process the mission until there is no parent
    while (true) {
      parentId = _missionEvents[currentIndex]['mission']['parent_'];

      if (parentId == null) {
        _lineageFor[currentIndex] = LineageShape.origin;
        break;
      }

      _lineageFor[currentIndex] = LineageShape.connection;

      currentIndex = _indexFor[parentId]!;
    }

    // Iterate over the missions from origin to endpoint and update anything unset
    // to `notConnection`.
    for (int i = selectedIndex; i != currentIndex; i--) {
      _lineageFor[i] ??= LineageShape.notConnection;
    }
  }
}
