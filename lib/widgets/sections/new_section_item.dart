import 'package:flutter/material.dart';
import 'package:the_process/actions/sections/create_section.dart';
import 'package:the_process/actions/sections/update_new_section_v_m.dart';
import 'package:the_process/extensions/flutter_extensions.dart';

class NewSectionItem extends StatelessWidget {
  const NewSectionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 4.0),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: 'Enter a name...',
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FloatingActionButton(
              onPressed: () => context.dispatch(CreateSection()),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              mini: true,
              elevation: 1,
              child: Icon(Icons.add),
            ),
          ),
        ),
        onChanged: (value) => context.dispatch(UpdateNewSectionVM(name: value)),
      ),
    );
  }
}
