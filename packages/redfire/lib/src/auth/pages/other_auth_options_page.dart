import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/auth/actions/sign_in_with_git_hub_action.dart';
import 'package:redfire/src/auth/models/other_auth_options_page_model.dart';
import 'package:redfire/src/auth/widgets/other_auth_options_page_buttons/git_hub_sign_in_button.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/src/shared/widgets/empty_app_bar.dart';
import 'package:redfire/src/types/red_fire_state.dart';

class OtherAuthOptionsPage<T extends RedFireState> extends StatelessWidget {
  const OtherAuthOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: Center(
        child: StoreConnector<T, OtherAuthOptionsPageModel>(
          distinct: true,
          converter: (store) => OtherAuthOptionsPageModel(store.state.auth),
          builder: (context, vm) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GitHubSignInButton(
                    onPressed: () =>
                        context.dispatch<T>(const SignInWithGitHubAction()))
              ],
            );
          },
        ),
      ),
    );
  }
}
