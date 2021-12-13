import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import '../../../actions.dart';
import '../../redux/extensions/build_context_extensions.dart';
import '../../types/red_fire_state.dart';
import '../models/auth_page_model.dart';
import '../pages/other_auth_options_page_data.dart';
import 'auth_page_buttons/platform_default_sign_in_button.dart';
import 'auth_page_text_fields/email_text_field.dart';
import 'auth_page_text_fields/password_text_field.dart';

class AuthPage<T extends RedFireState> extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Center(
        child: StoreConnector<T, AuthPageModel>(
          distinct: true,
          converter: (store) =>
              AuthPageModel(store.state.settings.platform, store.state.auth),
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
                OutlinedButton.icon(
                    onPressed: () => context.dispatch<T>(
                        const PushPageAction(OtherAuthOptionsPageData())),
                    icon: const Icon(Icons.arrow_right_sharp),
                    label: const Text('More Options')),
                PlatformDefaultSignInButton<T>(vm.platform)
              ],
            );
          },
        ),
      ),
    );
  }
}
