import 'package:flutter/material.dart';

import '../../models/section_model.dart';

class SectionsListItem extends StatelessWidget {
  final SectionModel _section;

  const SectionsListItem(SectionModel section, {Key? key})
      : _section = section,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
      child: SizedBox(
        height: 65,
        child: Card(
          color: Colors.black12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  _section.name,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
