import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/actions/auth/sign_out.dart';
import 'package:the_process/actions/profile/disregard_profile_data.dart';
import 'package:the_process/actions/profile/observe_profile_data.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/extensions/flutter_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/profile/profile_data.dart';
import 'package:the_process/widgets/profile/buttons/asana_authorization_button.dart';
import 'package:the_process/widgets/profile/buttons/google_authorization_button.dart';
import 'package:the_process/widgets/shared/waiting_indicator.dart';

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
      ),
      body: Center(
          child: StoreConnector<AppState, ProfileData>(
        onInit: (store) => store.dispatch(ObserveProfileData()),
        onDispose: (store) => store.dispatch(DisregardProfileData()),
        distinct: true,
        converter: (store) => store.state.profileData,
        builder: (context, profileData) {
          return Column(
            children: [
              if (profileData == null)
                WaitingIndicator('Connecting to database...')
              else ...[
                Text(profileData.displayName),
                Row(
                  children: [
                    if (profileData.googleAuth ==
                        AuthorizationStep.gettingAuthorized)
                      CircularProgressIndicator()
                    else
                      GoogleAuthorizationButton(step: profileData.googleAuth),
                    if (profileData.asanaAuth ==
                        AuthorizationStep.gettingAuthorized)
                      CircularProgressIndicator()
                    else
                      AsanaAuthorizationButton(step: profileData.asanaAuth)
                  ],
                ),
              ],
              MaterialButton(
                  child: Text('Sign Out'),
                  onPressed: () => context.dispatch(SignOut())),
            ],
          );
        },
      )),
    );
  }
}
