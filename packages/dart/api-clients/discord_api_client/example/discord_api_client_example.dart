import 'package:discord_api_client/discord_api_client.dart';
import 'package:discord_api_client/src/api_client.dart';

import '../test/credentials.dart' as credentials;

void main() async {
  await createMessageCommand();
}

Future<void> createMessageCommand() async {
  final api = DiscordApi(
      applicationId: credentials.applicationId,
      guildId: credentials.guildId,
      botToken: credentials.botToken,
      version: 8);

  var command = ApplicationCommand(
    type: ApplicationCommandType.message,
    name: 'Run Dart code',
    description: '',
  );

  var response = await api.createCommand(command);
  print(response.body);
}
