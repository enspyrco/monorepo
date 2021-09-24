import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_process/widgets/home/project-overview/organisation-selection-view/create_organisation_button.dart';
import 'package:the_process/widgets/home/project-overview/organisation-selection-view/organisation_selection_dropdown.dart';
import 'package:the_process/widgets/home/project-overview/shared_widgets/selection_container.dart';
import 'package:the_process/widgets/home/project-overview/shared_widgets/selection_label.dart';

class OrganisationSelectionView extends StatelessWidget {
  const OrganisationSelectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SelectionContainer(
      widgets: [
        SelectionLabel(iconData: Icons.domain),
        OrganisationSelectionDropdown(),
        CreateOrganisationButton(),
      ],
    );
  }
}
