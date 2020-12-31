import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:the_process/models/sections/section.dart';

class SectionsListView extends StatelessWidget {
  final BuiltList<Section> sections;

  const SectionsListView(this.sections, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: sections.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(title: Text(sections[index].name)),
      ),
    );
  }
}
