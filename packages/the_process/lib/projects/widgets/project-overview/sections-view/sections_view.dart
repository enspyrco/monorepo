import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/widgets.dart';
import 'package:the_process/main.dart';
import 'package:the_process/projects/models/sections_v_m.dart';
import 'package:the_process/projects/widgets/project-overview/sections-view/new_section_item.dart';
import 'package:the_process/projects/widgets/project-overview/sections-view/sections_list_view.dart';
import 'package:the_process/sections/actions/tap_sections_action.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SectionsVM?>(
      onInit: (store) => store.dispatch(TapSectionsAction()),
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
