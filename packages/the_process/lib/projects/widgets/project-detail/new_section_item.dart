import 'package:flutter/material.dart';

import 'package:redfire/extensions.dart';

import '../../../app_state.dart';
import '../../../sections/actions/create_section_action.dart';
import '../../../sections/actions/update_new_section_v_m_action.dart';

class NewSectionItem extends StatelessWidget {
  const NewSectionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 4.0),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: 'Enter a name...',
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FloatingActionButton(
              onPressed: () =>
                  context.dispatch<AppState>(const CreateSectionAction()),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              mini: true,
              elevation: 1,
              child: const Icon(Icons.add),
            ),
          ),
        ),
        onChanged: (value) =>
            context.dispatch<AppState>(UpdateNewSectionVMAction(name: value)),
      ),
    );
  }
}
