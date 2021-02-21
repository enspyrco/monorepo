import 'dart:convert';

import 'package:googleapis/secretmanager/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

extension SecretPayloadExtension on SecretPayload {
  ClientId toClientId() {
    final jsonMap = json.decode(utf8.decode(dataAsBytes));
    return ClientId(jsonMap['google']['id'], jsonMap['google']['secret']);
  }
}
