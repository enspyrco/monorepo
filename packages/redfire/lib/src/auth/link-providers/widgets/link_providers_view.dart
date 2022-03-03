import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import '../../../types/red_fire_state.dart';
import '../../enums/providers_enum.dart';
import '../models/link_accounts_view_model.dart';
import 'link_provider_button.dart';

class LinkProvidersView<T extends RedFireState> extends StatelessWidget {
  const LinkProvidersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<T, LinkAccountsViewModel>(
      distinct: true,
      converter: (store) => store.state.auth.linking,
      builder: (context, vm) => SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var provider in ProvidersEnum.values)
              LinkProviderButton<T>(provider, vm.stateOf[provider]!)
          ],
        ),
      ),
    );
  }
}
