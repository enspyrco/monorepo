import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/auth/models/auth_page_v_m.dart';
import 'package:redfire/src/auth/widgets/auth_page_buttons/platform_default_sign_in_button.dart';
import 'package:redfire/src/auth/widgets/auth_page_text_fields/email_text_field.dart';
import 'package:redfire/src/auth/widgets/auth_page_text_fields/password_text_field.dart';
import 'package:redfire/src/types/red_fire_state.dart';

class AuthPage<T extends RedFireState> extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Center(
        child: StoreConnector<T, AuthPageVM>(
          distinct: true,
          converter: (store) =>
              AuthPageVM(store.state.settings.platform, store.state.auth),
          builder: (context, vm) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (vm.auth.emailVM.email == null)
                  EmailTextField<T>()
                else if (vm.auth.emailVM.providers == null)
                  const CircularProgressIndicator()
                else
                  PasswordTextField<T>(
                      accountExists: vm.auth.emailVM.providers!.isNotEmpty),
                PlatformDefaultSignInButton<T>(vm.platform)
              ],
            );
          },
        ),
      ),
    );
  }
}
