import 'package:flutter/material.dart';
import 'package:the_process/models/sections/section.dart';
import 'package:the_process/utils/immutable_collections/immutable_list.dart';
import 'package:the_process/widgets/sections/sections_list_item.dart';

class SectionsListView extends StatelessWidget {
  final ImmutableList<Section> sections;

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
