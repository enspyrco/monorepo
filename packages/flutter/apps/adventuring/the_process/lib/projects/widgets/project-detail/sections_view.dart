import 'package:astro/astro.dart';
import 'package:flutter/material.dart';

import '../../../app/state/app_state.dart';
import '../../../sections/missions/tap_sections.dart';
import '../../models/sections_state.dart';
import 'new_section_item.dart';
import 'sections_list_view.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, SectionsState?>(
      onInit: (missionControl) => missionControl.launch(const TapSections()),
      transformer: (state) => state.sections,
      builder: (context, vm) {
        if (vm == null || vm.creatingNewSection) {
          return const ProgressIndicatorWithMessage('Creating...');
        }
        return Column(
          children: [
            SectionsListView(vm.list),
            const NewSectionItem(),
          ],
        );
      },
    );
  }
}
