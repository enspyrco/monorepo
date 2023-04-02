import 'package:discord_api_client/discord_api_client.dart';
import 'package:discord_api_client/src/api_client.dart';
import 'package:test/test.dart';

import 'credentials.dart';

void main() {
  test('Create DartRunner command', () async {
    final api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    var command = ChatCommand(
      name: 'run',
      description:
          'Provide some Dart code, it run on the server and the result shown here',
    )..addStringOption(
        name: 'code', description: 'The Dart code to be run', required: true);

    var response = await api.createCommand(command);
    print(response.body);
  }, skip: true); // we skip e2e tests and run individually as desired

  test('Create objects and combine into a command', () async {
    final api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    var command = ApplicationCommand(
        type: ApplicationCommandType.chatInput,
        name: 'blep',
        description: 'Send a random adorable animal photo',
        options: [
          ApplicationCommandOption(
              type: ApplicationCommandOptionType.string,
              name: 'animal',
              description: 'The type of animal',
              required: true,
              choices: [
                {'Dog': 'animal_dog'},
                {'Cat': 'animal_cat'},
                {'Penguin': 'animal_penguin'},
              ]),
          ApplicationCommandOption(
            type: ApplicationCommandOptionType.boolean,
            name: 'only_smol',
            description: 'Whether to show only baby animals',
          )
        ]);

    var response = await api.createCommand(command);
    print(response.body);
  }, skip: true); // we skip e2e tests and run individually as desired

  test('Build a command with functions', () async {
    final api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    var command = ChatCommand(
        name: 'blep', description: 'Send a random adorable animal photo')
      ..addStringOption(
          name: 'animal',
          description: 'The type of animal',
          required: true,
          choices: [
            {'Dog': 'animal_dog'},
            {'Cat': 'animal_cat'},
            {'Penguin': 'animal_penguin'},
          ])
      ..addBooleanOption(
          name: 'only_smol', description: 'Whether to show only baby animals');

    var response = await api.createCommand(command);
    print(response.body);
  }, skip: true); // we skip e2e tests and run individually as desired

  test('Get commands', () async {
    var api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    var response = await api.getCommands();
    print(response.body);
  }, skip: true); // we skip e2e tests and run individually as desired

  test('Delete a command', () async {
    var api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    var response = await api.deletCommand('...');
    print(response.body);
  }, skip: true); // we skip e2e tests and run individually as desired
}
