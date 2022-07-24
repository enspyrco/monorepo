import 'package:discord_api_client/discord_api_client.dart';
import 'package:discord_api_client/src/api_client.dart';
import 'package:test/test.dart';

import 'credentials.dart';

void main() {
  test('hello', () async {
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

    var dartJson = command.toJson();
    var json = {
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

    for (var key in json.keys) {
      expect(dartJson[key], equals(json[key]));
    }

    // expect(dartJson['name'], equals(json['name']));
    // expect(dartJson['type'], equals(json['type']));
    // expect(dartJson['description'], equals(json['description']));

    // var dartOption1 = (dartJson['options'] as List<JsonMap>).first;
    // var option1 = (json['options'] as List<JsonMap>).first;

    // expect(dartOption1['name'], equals(option1['name']));
    // expect(dartOption1['description'], equals(option1['description']));
  }, skip: true);

  test('hello', () async {
    final api = DiscordApi(
        applicationId: applicationId,
        guildId: guildId,
        botToken: botToken,
        version: 8);

    // create a right-click USER command
    final response =
        await api.createCommandFrom({'name': 'High Five', 'type': 2});
    print(response.body);
  }, skip: true);
}
