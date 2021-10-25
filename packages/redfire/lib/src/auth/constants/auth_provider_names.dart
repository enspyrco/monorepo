import 'package:redfire/src/auth/enums/providers_enum.dart';
import 'package:redfire/src/shared/icons/red_fire_icons_icons.dart';

const authProviderNameOf = {
  ProvidersEnum.email: 'password',
  ProvidersEnum.google: 'google.com',
  ProvidersEnum.gitHub: 'github.com',
  ProvidersEnum.apple: 'apple.com',
};

const authProviderEnumFrom = {
  'password': ProvidersEnum.email,
  'google.com': ProvidersEnum.google,
  'github.com': ProvidersEnum.gitHub,
  'apple.com': ProvidersEnum.apple,
};

const authProviderIconFrom = {
  ProvidersEnum.email: RedFireIcons.mail,
  ProvidersEnum.google: RedFireIcons.google,
  ProvidersEnum.gitHub: RedFireIcons.github,
  ProvidersEnum.apple: RedFireIcons.apple,
};
