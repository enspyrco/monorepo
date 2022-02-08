import '../../../../types.dart';
import '../../../shared/icons/red_fire_icons_icons.dart';

const authProviderIdOf = {
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
