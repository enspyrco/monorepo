import 'package:flutter/material.dart';

import '../../models/section_model.dart';
import 'sections_list_item.dart';

class SectionsListView extends StatelessWidget {
  final List<SectionModel> sections;

  const SectionsListView(this.sections, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: sections.length,
        itemBuilder: (context, index) => SectionsListItem(sections[index]),
      ),
    );
  }
}
