import 'package:flutter/material.dart';
import 'package:the_process/actions/sections/create_section.dart';
import 'package:the_process/actions/sections/update_new_section_v_m.dart';
import 'package:the_process/extensions/flutter_extensions.dart';

class NewSectionItem extends StatelessWidget {
  const NewSectionItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 15),
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
