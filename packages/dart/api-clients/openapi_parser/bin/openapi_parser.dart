import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  final openapiFile = File('github-openapi-description/ghes-3.7.json');
  final openapiJsonString = openapiFile.readAsStringSync();
  final openapiJson = jsonDecode(openapiJsonString);

  print("Version: ${openapiJson['openapi']}");
  print("Paths: ${openapiJson['paths']?.length}");
  print("Components: ${openapiJson['components']?.length}");
  print("Webhooks: ${openapiJson['webhooks']?.length}");

  print("${openapiJson['info']['x-github-release']?.runtimeType}");
}
