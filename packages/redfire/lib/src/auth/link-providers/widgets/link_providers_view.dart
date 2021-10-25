import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/auth/enums/providers_enum.dart';
import 'package:redfire/src/auth/link-providers/widgets/link_provider_button.dart';
import 'package:redfire/src/auth/models/auth_user_data.dart';
import 'package:redfire/src/types/red_fire_state.dart';

class LinkProvidersView<T extends RedFireState> extends StatelessWidget {
  const LinkProvidersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<T, AuthUserData?>(
      distinct: true,
      converter: (store) => store.state.auth.userData,
      builder: (context, data) => (data == null)
          ? Container()
          : SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var provider in ProvidersEnum.values)
                    LinkProviderButton(provider)
                ],
              ),
            ),
    );
  }
}
