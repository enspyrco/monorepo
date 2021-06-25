import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/actions/auth/sign_out_action.dart';
import 'package:the_process/actions/profile/disregard_profile_data_action.dart';
import 'package:the_process/actions/profile/observe_profile_data_action.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider_name.dart';
import 'package:the_process/extensions/flutter_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/profile/profile_data.dart';
import 'package:the_process/widgets/profile/buttons/asana_authorization_button.dart';
import 'package:the_process/widgets/profile/buttons/google_authorization_button.dart';
import 'package:the_process/widgets/shared/waiting_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
          child: StoreConnector<AppState, ProfileData?>(
        onInit: (store) => store.dispatch(ObserveProfileDataAction()),
        onDispose: (store) => store.dispatch(DisregardProfileDataAction()),
        distinct: true,
        converter: (store) => store.state.profileData,
        builder: (context, profileData) {
          return Column(
            children: [
              if (profileData == null)
                const WaitingIndicator('Connecting to database...')
              else ...[
                Text(
                    profileData.displayName ?? 'they who have yet to be named'),
                Row(
                  children: [
                    if (profileData.authorizationStatus[ProviderName.google] ==
                        AuthorizationStep.gettingAuthorized)
                      const CircularProgressIndicator()
                    else
                      GoogleAuthorizationButton(
                          step: profileData
                                  .authorizationStatus[ProviderName.google] ??
                              AuthorizationStep.unknown),
                    if (profileData.authorizationStatus[ProviderName.asana] ==
                        AuthorizationStep.gettingAuthorized)
                      const CircularProgressIndicator()
                    else
                      AsanaAuthorizationButton(
                          step: profileData
                                  .authorizationStatus[ProviderName.asana] ??
                              AuthorizationStep.unknown)
                  ],
                ),
              ],
              MaterialButton(
                onPressed: () => context.dispatch(SignOutAction()),
                child: const Text('Sign Out'),
              ),
            ],
          );
        },
      )),
    );
  }
}
