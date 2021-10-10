import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flireator/organisations/models/organisations_view_model.dart';
import 'package:flireator/organisations/pages/create_organisation_page_data_transforms.dart';
import 'package:flireator/widgets/main_page.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

part 'main.freezed.dart';
part 'main.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    /// RedFire AppState members
    required AuthState auth,
    @PageDataConverter() required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    ProfileData? profile,

    /// Additional AppState members
    required OrganisationsViewModel organisations,
  }) = _AppState;

  factory AppState.init() => AppState(
        /// RedFire init code
        auth: AuthState.init(),
        pages: <PageData>[InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),

        /// Additional init code
        organisations: OrganisationsViewModel.init(),
      );

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: const [],
      reducers: const [],
      pageTransforms: [CreateOrganisationPageDataTransforms()],
      title: 'Flireator',
      mainPage: const MainPage(),
    ));
