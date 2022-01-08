import 'dart:io';

abstract class Locator {
  static final Map<String, String> _envVars = {};
  static String getEnvVar(String name) =>
      _envVars[name] ?? Platform.environment[name] ?? '';
  static setEnvVar(String name, String value) => _envVars[name] = value;
}
