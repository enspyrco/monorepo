import 'dart:convert';

import 'package:googleapis/secretmanager/v1.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'secretmanager_api_test_doubles.mocks.dart';

@GenerateMocks([
  SecretmanagerApi,
  ProjectsResourceApi,
  ProjectsSecretsResourceApi,
  ProjectsSecretsVersionsResourceApi,
  AccessSecretVersionResponse
])
class SecretmanagerApiTestDoubles {
  SecretmanagerApiTestDoubles();
}

enum SecretmanagerFunctionNamed { access }

MockSecretmanagerApi createSecretmanagerApiMockThatReturns(
    {required SecretPayload payload,
    required SecretmanagerFunctionNamed onCalling}) {
  final mockSecretmanagerApi = MockSecretmanagerApi();
  final mockProjectsResourceApi = MockProjectsResourceApi();
  final mockProjectsSecretsResourceApi = MockProjectsSecretsResourceApi();
  final mockProjectsSecretsVersionsResourceApi =
      MockProjectsSecretsVersionsResourceApi();
  final mockAccessSecretVersionResponse = MockAccessSecretVersionResponse();

  when(mockSecretmanagerApi.projects).thenReturn(mockProjectsResourceApi);
  when(mockProjectsResourceApi.secrets)
      .thenReturn(mockProjectsSecretsResourceApi);
  when(mockProjectsSecretsResourceApi.versions)
      .thenReturn(mockProjectsSecretsVersionsResourceApi);
  when(mockProjectsSecretsVersionsResourceApi.access(any))
      .thenAnswer((_) => Future.value(mockAccessSecretVersionResponse));
  when(mockAccessSecretVersionResponse.payload).thenReturn(payload);

  SecretPayload();

  return mockSecretmanagerApi;
}

MockSecretmanagerApi createSecretmanagerApiMockThatThrows(
    {required Exception exception}) {
  final mockSecretmanagerApi = MockSecretmanagerApi();
  when(mockSecretmanagerApi.projects).thenThrow(exception);
  return mockSecretmanagerApi;
}

SecretPayload createSecretPayloadFrom({required String json}) {
  final payload = SecretPayload();
  payload.data = base64.encode(utf8.encode(json));
  return payload;
}
