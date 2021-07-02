import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/src/profile/models/profile_data.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/src/shared/widgets/waiting_indicator.dart';
import 'package:redfire/types.dart';

import 'buttons/asana_authorization_button.dart';
import 'buttons/google_authorization_button.dart';

class ProfilePage<T extends RedFireState> extends StatelessWidget {
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
          child: StoreConnector<T, ProfileData?>(
        onInit: (store) => store.dispatch(TapProfileAction()),
        onDispose: (store) => store.dispatch(TapProfileAction(turnOff: true)),
        distinct: true,
        converter: (store) => store.state.profile,
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
                    if (profileData.authorizationStatus[ProvidersEnum.google] ==
                        AuthorizationEnum.gettingAuthorized)
                      const CircularProgressIndicator()
                    else
                      GoogleAuthorizationButton(
                          step: profileData
                                  .authorizationStatus[ProvidersEnum.google] ??
                              AuthorizationEnum.unknown),
                    if (profileData.authorizationStatus[ProvidersEnum.asana] ==
                        AuthorizationEnum.gettingAuthorized)
                      const CircularProgressIndicator()
                    else
                      AsanaAuthorizationButton(
                          step: profileData
                                  .authorizationStatus[ProvidersEnum.asana] ??
                              AuthorizationEnum.unknown)
                  ],
                ),
              ],
              MaterialButton(
                onPressed: () => context.dispatch<T>(SignOutAction()),
                child: const Text('Sign Out'),
              ),
            ],
          );
        },
      )),
    );
  }
}
