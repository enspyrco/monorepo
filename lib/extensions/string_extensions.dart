import 'package:the_process/enums/auth/auth_step_enum.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider_name.dart';

extension EnumParser on String {
  ProviderName toProviderNameEnum() {
    return ProviderName.values
        .firstWhere((e) => e.toString().toLowerCase() == 'providerName.$this');
  }

  AuthStepEnum toAuthStepEnum() {
    return AuthStepEnum.values
        .firstWhere((e) => e.toString().toLowerCase() == 'authStep.$this');
  }

  AuthorizationStep toAuthorizationStepEnum() {
    return AuthorizationStep.values.firstWhere(
        (e) => e.toString().toLowerCase() == 'authorizationStep.$this');
  }
}
