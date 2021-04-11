import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:the_process/models/sections/section.dart';
import 'package:the_process/widgets/home/project-overview/sections/sections_list_item.dart';

class SectionsListView extends StatelessWidget {
  final IList<Section> sections;

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
