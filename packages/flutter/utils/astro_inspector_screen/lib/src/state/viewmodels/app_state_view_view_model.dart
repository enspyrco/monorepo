import 'package:astro_types/json_types.dart';

/// ViewModel class for the [AppStateView] widget
class AppStateViewViewModel {
  final JsonMap selectedAppState;
  final JsonMap previousAppState;

  AppStateViewViewModel(this.selectedAppState, this.previousAppState);
}
