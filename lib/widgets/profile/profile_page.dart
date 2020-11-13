import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/actions/auth/sign_out.dart';
import 'package:the_process/actions/profile/disregard_profile_data.dart';
import 'package:the_process/actions/profile/observe_profile_data.dart';
import 'package:the_process/extensions/flutter_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/profile/profile_data.dart';

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
        builder: (context, profile) {
          return MaterialButton(
            child: Text('Sign Out'),
            onPressed: () => context.dispatch(SignOut()),
          );
        },
      )),
    );
  }
}
