import 'package:flutter/material.dart';
import 'package:redfire/extensions.dart';
import 'package:the_process/actions/project_sections/create_project_section_action.dart';
import 'package:the_process/actions/project_sections/update_new_project_section_v_m_action.dart';

import '../../../../main.dart';

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
                  context.dispatch<AppState>(CreateProjectSectionAction()),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              mini: true,
              elevation: 1,
              child: const Icon(Icons.add),
            ),
          ),
        ),
        onChanged: (value) => context
            .dispatch<AppState>(UpdateNewProjectSectionVMAction(name: value)),
      ),
    );
  }
}
