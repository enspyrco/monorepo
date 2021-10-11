import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flireator/main.dart';
import 'package:flireator/organisations/pages/edit_organisations_page_data.dart';
import 'package:flireator/organisations/widgets/organisations_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthUserData?>(
      distinct: true,
      converter: (store) => store.state.auth.userData,
      builder: (context, userData) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              AccountButton<AppState>(
                options: ISet(
                  [
                    AccountButtonOption(
                        'Edit Organisations',
                        (context) => context.dispatch<AppState>(
                            PushPageAction(EditOrganisationsPageData())))
                  ],
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [OrganisationsDropdown()],
              )
            ],
          ),
        );
      },
    );
  }
}
