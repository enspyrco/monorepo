import 'package:flutter/widgets.dart';

import '../../../../../types.dart';
import '../../../../auth/actions/sign_out_action.dart';
import '../../../../navigation/actions/push_page_action.dart';
import '../../../../redux/extensions/build_context_extensions.dart';
import 'menu_option.dart';

// We need to create top level constants or we get
// Error: Non-redirecting const factory invocation is not a constant expression.
// When we stop using freezed we shouldn't need to do this
const _pushProfilePageAction = PushPageAction(ProfilePageData());
const _signOutAction = SignOutAction();

enum MenuOptionPreset implements MenuOption {
  accountDetails('Account Details', _pushProfilePageAction),
  signOut('Sign Out', _signOutAction);

  const MenuOptionPreset(this.name, this.action);

  @override
  final String name;
  @override
  final ReduxAction action;

  @override
  dynamic dispatchAction<T extends RedFireState>(BuildContext context) =>
      context.dispatch<T>(action);
}
