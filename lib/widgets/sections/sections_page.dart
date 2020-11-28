import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/actions/sections/create_section.dart';
import 'package:the_process/actions/sections/store_new_section_name.dart';
import 'package:the_process/extensions/flutter_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/sections/sections_v_m.dart';

class SectionsPage extends StatelessWidget {
  const SectionsPage();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SectionsVM>(
      distinct: true,
      converter: (store) => store.state.sectionsVM,
      builder: (context, vm) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (vm.creatingSection)
              Text('Creating...')
            else
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Enter a name...'),
                  onChanged: (value) =>
                      context.dispatch(StoreNewSectionName(value: value)),
                ),
              ),
            if (vm.creatingSection)
              CircularProgressIndicator()
            else
              MaterialButton(
                child: Text('GO'),
                onPressed: () => context.dispatch(CreateSection()),
              )
          ],
        );
      },
    );
  }
}
