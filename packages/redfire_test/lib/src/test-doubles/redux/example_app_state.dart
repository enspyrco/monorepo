import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'example_app_state.freezed.dart';
part 'example_app_state.g.dart';

@freezed
class ExampleAppState with _$ExampleAppState, RedFireState {
  factory ExampleAppState({
    @PageDataConverter() required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    required AuthState auth,
    ProfileData? profile,
  }) = _ExampleAppState;

  factory ExampleAppState.init() => ExampleAppState(
        pages: <PageData>[InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),
        auth: AuthState(
            linking: LinkAccountsViewModel.init(),
            emailVM: EmailAuthVM(),
            step: AuthStepEnum.waitingForInput),
      );

  factory ExampleAppState.fromJson(JsonMap json) =>
      _$ExampleAppStateFromJson(json);
}
