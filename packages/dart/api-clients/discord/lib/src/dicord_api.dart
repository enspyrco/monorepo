import 'dart:convert';

import 'package:http/http.dart';

enum ApplicationScope { global, guild }

class DiscordApi {
  DiscordApi({
    required this.applicationId,
    this.guildId,
    required this.botToken,
    required this.version,
    ApplicationScope scope = ApplicationScope.guild,
  }) {
    _url = scope == ApplicationScope.global
        ? 'https://discord.com/api/v$version/applications/$applicationId/commands'
        : 'https://discord.com/api/v$version/applications/$applicationId/guilds/$guildId/commands';
  }

  late final String _url;
  final String applicationId;
  final String? guildId;
  final String botToken;
  final int version;
  late final headers = {'Authorization': 'Bot $botToken'};
  late final headersJson = {
    'Authorization': 'Bot $botToken',
    'Content-type': 'application/json'
  };

  Future<Response> getCommands() async {
    final response = await get(Uri.parse(_url), headers: headers);

    return response;
  }

  Future<Response> createCommand(Map<String, Object?> json) async {
    final response = await post(Uri.parse(_url),
        headers: headersJson, body: jsonEncode(json));

    return response;
  }

  Future<Response> deletCommand(String id) async {
    final response = await delete(Uri.parse(_url + '/$id'), headers: headers);

    return response;
  }

  Future<Response> updateCommand(
      {required String id, required Map<String, Object?> json}) async {
    final response = await patch(Uri.parse(_url + '/$id'),
        headers: headers, body: jsonEncode(json));

    return response;
  }
}
