import 'package:built_collection/built_collection.dart';
import 'package:flireator/actions/auth/sign_out.dart';
import 'package:flireator/extensions/flutter/build_context_extensions.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/models/credentials/credential_info.dart';
import 'package:flireator/widgets/profile/activate-buttons/apple_activate_button.dart';
import 'package:flireator/widgets/profile/activate-buttons/git_hub_activate_button.dart';
import 'package:flireator/widgets/profile/activate-buttons/google_activate_button.dart';
import 'package:flireator/widgets/profile/cards/apple_card.dart';
import 'package:flireator/widgets/profile/cards/git_hub_card.dart';
import 'package:flireator/widgets/profile/cards/google_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          MaterialButton(
            onPressed: () => context.dispatch(SignOut()),
            child: Text('Sign Out'),
          ),
        ],
      ),
      body: Center(
        child: StoreConnector<AppState, BuiltMap<String, CredentialInfo>?>(
          distinct: true,
          converter: (store) => store.state.flireator?.credentials,
          builder: (context, credentialsMap) {
            if (credentialsMap == null) return Container();
            return Column(children: [
              if (credentialsMap['apple'] != null)
                AppleCard()
              else
                AppleActivateButton(),
              if (credentialsMap['github'] != null)
                GitHubCard()
              else
                GitHubActivateButton(),
              if (credentialsMap['apple'] != null)
                GoogleCard()
              else
                GoogleActivateButton()
            ]);
          },
        ),
      ),
    );
  }
}
