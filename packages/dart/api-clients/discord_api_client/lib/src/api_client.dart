import 'dart:convert';

import 'package:http/http.dart';

import '../discord_api_client.dart';

enum ApplicationScope { global, guild }

class DiscordApi {
  DiscordApi({
    required this.applicationId,
    this.guildId,
    required this.botToken,
    required this.version,
    ApplicationScope scope = ApplicationScope.guild,
  }) {
    _uri = scope == ApplicationScope.global
        ? Uri.parse(
            'https://discord.com/api/v$version/applications/$applicationId/commands')
        : Uri.parse(
            'https://discord.com/api/v$version/applications/$applicationId/guilds/$guildId/commands');
  }

  late final Uri _uri;
  final String applicationId;
  final String? guildId;
  final String botToken;
  final int version;
  late final headers = {'Authorization': 'Bot $botToken'};
  late final headersJson = {
    'Authorization': 'Bot $botToken',
    'Content-type': 'application/json'
  };

  Future<Response> createCommand(ApplicationCommand command) async {
    final encodedCommand = jsonEncode(command.toJson());

    final response =
        await post(_uri, headers: headersJson, body: encodedCommand);

    return response;
  }

  Future<Response> createCommandFrom(Map<String, Object?> json) async {
    final response =
        await post(_uri, headers: headersJson, body: jsonEncode(json));

    return response;
  }

  Future<Response> getCommands() async {
    final response = await get(_uri, headers: headers);

    return response;
  }

  Future<Response> deletCommand(String id) async {
    final response =
        await delete(_uri.replace(path: _uri.path + '/$id'), headers: headers);

    return response;
  }

  Future<Response> updateCommand(
      {required String id, required Map<String, Object?> json}) async {
    final response = await patch(_uri.replace(path: _uri.path + '/$id'),
        headers: headers, body: jsonEncode(json));

    return response;
  }
}
