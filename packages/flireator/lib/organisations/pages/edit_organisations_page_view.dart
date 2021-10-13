import 'package:flireator/main.dart';
import 'package:flireator/organisations/models/organisations_editor_view_model.dart';
import 'package:flireator/organisations/widgets/organisation_creator_view.dart';
import 'package:flireator/organisations/widgets/organisation_selector_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EditOrganisationsPageView extends StatelessWidget {
  const EditOrganisationsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OrganisationsEditorViewModel>(
      distinct: true,
      converter: (store) => store.state.organisations.editor,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  OrganisationSelectorView(),
                  OrganisationCreatorView()
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
