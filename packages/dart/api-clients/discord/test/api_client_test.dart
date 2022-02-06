import 'package:discord_api_client/discord_api_client.dart';
import 'package:discord_api_client/src/api_client.dart';
import 'package:test/test.dart';

import 'credentials.dart';

void main() {
  test('hello', () async {
    final api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    var command = ApplicationCommand(
        id: '',
        type: ApplicationCommandType.chatInput,
        name: 'blep',
        description: 'Send a random adorable animal photo',
        version: 8,
        options: [
          ApplicationCommandOption(
              type: ApplicationCommandOptionType.string,
              name: 'animal',
              description: 'The type of animal',
              required: true,
              choices: [
                ApplicationCommandOptionChoice(
                  name: 'Dog',
                  value: 'animal_dog',
                ),
                ApplicationCommandOptionChoice(
                  name: 'Cat',
                  value: 'animal_cat',
                ),
                ApplicationCommandOptionChoice(
                  name: 'Penguin',
                  value: 'animal_penguin',
                ),
              ]),
          ApplicationCommandOption(
            type: ApplicationCommandOptionType.boolean,
            name: 'only_smol',
            description: 'Whether to show only baby animals',
            required: false,
          )
        ]);

    var response = await api.create(command: command);
    print(response.body);
  });

  test('description', () async {
    var api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    var response = await api.getCommands();
    print(response.body);
  });

  test('description', () async {
    var api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    var response = await api.deletCommand('...');
    print(response.body);
  });
}
