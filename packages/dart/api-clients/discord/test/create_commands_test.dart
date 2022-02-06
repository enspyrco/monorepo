import 'package:discord_api_client/discord_api_client.dart';
import 'package:discord_api_client/src/dicord_api.dart';
import 'package:test/test.dart';

import 'credentials.dart';

void main() {
  test('', () async {
    final api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    // final response = await manager.getCommands();
    // print(response.body);

    // final response = await manager.deletCommand('938767156089323530');
    // print(response.body);

    ApplicationCommand(
        id: '',
        type: ApplicationCommandType.chatInput,
        applicationId: applicationId,
        name: 'blep',
        description: 'Send a random adorable animal photo',
        version: 8);

    ApplicationCommandOption(
        type: ApplicationCommandOptionType.string,
        name: 'animal',
        description: 'The type of animal',
        required: true,
        choices: [
          ApplicationCommandOptionChoice(name: 'Dog', value: 'animal_dog,')
        ]);

    final json = {
      "name": "blep",
      "type": 1,
      "description": "Send a random adorable animal photo",
      "options": [
        {
          "name": "animal",
          "description": "The type of animal",
          "type": 3,
          "required": true,
          "choices": [
            {"name": "Dog", "value": "animal_dog"},
            {"name": "Cat", "value": "animal_cat"},
            {"name": "Penguin", "value": "animal_penguin"}
          ]
        },
        {
          "name": "only_smol",
          "description": "Whether to show only baby animals",
          "type": 5,
          "required": false
        }
      ]
    };
  });
}

// create a right-click USER command
// final response =
//         await manager.createCommand({'name': 'High Five', 'type': 2});
//     print(response.body);