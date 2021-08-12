import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/widgets.dart';
import 'package:the_process/actions/project_sections/tap_project_sections_action.dart';
import 'package:the_process/models/project_sections/project_sections_v_m.dart';
import 'package:the_process/widgets/home/project-overview/sections-view/new_section_item.dart';
import 'package:the_process/widgets/home/project-overview/sections-view/sections_list_view.dart';

import '../../../../main.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProjectSectionsVM?>(
      onInit: (store) => store.dispatch(TapProjectSectionsAction()),
      distinct: true,
      converter: (store) => store.state.sections,
      builder: (context, vm) {
        if (vm == null || vm.creatingNewSection) {
          return const WaitingIndicator('Creating...');
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
