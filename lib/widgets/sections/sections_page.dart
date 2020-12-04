import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/actions/sections/create_section.dart';
import 'package:the_process/actions/sections/update_new_section_v_m.dart';
import 'package:the_process/actions/shared/connect_database.dart';
import 'package:the_process/enums/database/database_section.dart';
import 'package:the_process/extensions/flutter_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/sections/sections_v_m.dart';
import 'package:the_process/widgets/shared/waiting_indicator.dart';

class SectionsPage extends StatelessWidget {
  const SectionsPage();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SectionsVM>(
      onInit: (store) =>
          store.dispatch(ConnectDatabase(section: DatabaseSection.sections)),
      distinct: true,
      converter: (store) => store.state.sections,
      builder: (context, vm) {
        if (vm.newSection.creating) {
          return WaitingIndicator('Creating...');
        }
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: vm.list.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(title: Text(vm.list[index].name)),
              ),
            ),
            NewSectionItem('${vm.newSection.number}'),
          ],
        );
      },
    );
  }
}

class NewSectionItem extends StatelessWidget {
  final String startingNumber;
  const NewSectionItem(
    this.startingNumber, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 50,
          child: TextField(
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: startingNumber),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                final intValue = int.tryParse(value);
                if (intValue != null) {
                  context.dispatch(UpdateNewSectionVM(number: intValue));
                }
              }),
        ),
        SizedBox(
          width: 15,
        ),
        SizedBox(
          width: 200,
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a name...'),
            onChanged: (value) =>
                context.dispatch(UpdateNewSectionVM(name: value)),
          ),
        ),
        MaterialButton(
          child: Text('GO'),
          onPressed: () => context.dispatch(CreateSection()),
        )
      ],
    );
  }
}
