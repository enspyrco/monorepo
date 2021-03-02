import 'dart:convert';

import 'package:googleapis/secretmanager/v1.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'secretmanager_api_test_doubles.mocks.dart';

@GenerateMocks([
  SecretManagerApi,
  ProjectsResource,
  ProjectsSecretsResource,
  ProjectsSecretsVersionsResource,
  AccessSecretVersionResponse
])
class SecretmanagerApiTestDoubles {
  SecretmanagerApiTestDoubles();
}

enum SecretmanagerFunctionNamed { access }

MockSecretManagerApi createSecretmanagerApiMockThatReturns(
    {required SecretPayload payload,
    required SecretmanagerFunctionNamed onCalling}) {
  final mockSecretManagerApi = MockSecretManagerApi();
  final mockProjectsResource = MockProjectsResource();
  final mockProjectsSecretsResource = MockProjectsSecretsResource();
  final mockProjectsSecretsVersionsResource =
      MockProjectsSecretsVersionsResource();
  final mockAccessSecretVersionResponse = MockAccessSecretVersionResponse();

  when(mockSecretManagerApi.projects).thenReturn(mockProjectsResource);
  when(mockProjectsResource.secrets).thenReturn(mockProjectsSecretsResource);
  when(mockProjectsSecretsResource.versions)
      .thenReturn(mockProjectsSecretsVersionsResource);
  when(mockProjectsSecretsVersionsResource.access(any))
      .thenAnswer((_) => Future.value(mockAccessSecretVersionResponse));
  when(mockAccessSecretVersionResponse.payload).thenReturn(payload);

  SecretPayload();

  return mockSecretManagerApi;
}

MockSecretManagerApi createSecretmanagerApiMockThatThrows(
    {required Exception exception}) {
  final mockSecretmanagerApi = MockSecretManagerApi();
  when(mockSecretmanagerApi.projects).thenThrow(exception);
  return mockSecretmanagerApi;
}

SecretPayload createSecretPayloadFrom({required String json}) {
  final payload = SecretPayload();
  payload.data = base64.encode(utf8.encode(json));
  return payload;
}
