import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/widgets.dart';

import '../../../app_state.dart';
import '../../../sections/actions/tap_sections_action.dart';
import '../../models/sections_v_m.dart';
import 'new_section_item.dart';
import 'sections_list_view.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SectionsVM?>(
      onInit: (store) => store.dispatch(const TapSectionsAction()),
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
