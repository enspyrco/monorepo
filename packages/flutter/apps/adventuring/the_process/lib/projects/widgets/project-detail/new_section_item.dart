import 'package:flutter/material.dart';

import '../../../build_context_extensions.dart';
import '../../../sections/missions/create_section.dart';
import '../../../sections/missions/update_new_section_v_m.dart';

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
              onPressed: () => context.launch(CreateSection()),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              mini: true,
              elevation: 1,
              child: const Icon(Icons.add),
            ),
          ),
        ),
        onChanged: (value) => context.land(UpdateNewSectionVM(name: value)),
      ),
    );
  }
}
