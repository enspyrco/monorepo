import 'package:redfire/src/auth/enums/providers_enum.dart';

const authProvidersMap = {
  ProvidersEnum.email: 'password',
  ProvidersEnum.phone: 'phone',
  ProvidersEnum.google: 'google.com',
  ProvidersEnum.gitHub: 'github.com',
  ProvidersEnum.apple: 'apple.com',
};

const authProviderNamesMap = {
  'password': ProvidersEnum.email,
  'phone': ProvidersEnum.phone,
  'google.com': ProvidersEnum.google,
  'github.com': ProvidersEnum.gitHub,
  'apple.com': ProvidersEnum.apple,
};
