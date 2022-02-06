import 'package:discord_api_client/src/typedefs.dart';

import 'channels.dart';

// https://discord.com/developers/docs/interactions/application-commands#application-command-object
class ApplicationCommand {
  ApplicationCommand(
      {required this.id,
      this.type = ApplicationCommandType.chatInput,
      required this.applicationId,
      this.guildId,
      required this.name,
      required this.description,
      this.options = const [],
      this.defaultPermission,
      required this.version});
  // unique id of the command	(snowflake)
  // VALID TYPES: all
  String id;

  // the type of command, defaults 1 if not set
  // VALID TYPES: all
  ApplicationCommandType type;

  // unique id of the parent application (snowflake)
  // VALID TYPES: all
  String applicationId;

  // guild id of the command, if not global (snowflake)
  // VALID TYPES: all
  String? guildId;

  // 1-32 character name
  // VALID TYPES: all
  String name;

  // 1-100 character description for CHAT_INPUT commands, empty string for USER and MESSAGE commands
  // VALID TYPES: all
  String description;

  // the parameters for the command, max 25
  // VALID TYPES: CHAT_INPUT
  List<ApplicationCommandOption> options;

  // (default true)	whether the command is enabled by default when the app is added to a guild
  // VALID TYPES: CHAT_INPUT
  bool? defaultPermission = true;

  // autoincrementing version identifier updated during substantial record changes (snowflake)
  // VALID TYPES: CHAT_INPUT
  int version;

  JsonMap toJson() {
    var json = {
      'id': id,
      'type': type.index,
      'applicationId': applicationId,
      'name': name,
      'description': description,
      'options': options,
      'defaultPermission': defaultPermission,
      'version': version,
    };
    if (guildId != null) json['guildId'] = guildId!;
    return json;
  }
}

// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-types
enum ApplicationCommandType {
  // Not for use, there is no type wth value zero
  zeroItem,

  // Slash commands; a text-based command that shows up when a user types /
  chatInput,

  // A UI-based command that shows up when you right click or tap on a user
  user,

  // A UI-based command that shows up when you right click or tap on a message
  message,
}

// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-option-structure
class ApplicationCommandOption {
  ApplicationCommandOption({
    required this.type,
    required this.name,
    required this.description,
    this.required = false,
    this.choices = const [],
    this.options = const [],
    this.channelTypes = const [],
    this.minValue,
    this.maxValue,
    this.autocomplete,
  });
  // the type of option
  ApplicationCommandOptionType type;

  // 1-32 character name
  String name;

  // 1-100 character description
  String description;

  // if the parameter is required or optional--default false
  bool required;

  // choices for STRING, INTEGER, and NUMBER types for the user to pick from, max 25
  List<ApplicationCommandOptionChoice> choices;

  // if the option is a subcommand or subcommand group type, these nested options will be the parameters
  List<ApplicationCommandOption> options;

  // if the option is a channel type, the channels shown will be restricted to these types
  List<ChannelType> channelTypes;

  // if the option is an INTEGER or NUMBER type, the minimum value permitted
  // integer for INTEGER options, double for NUMBER options
  num? minValue;

  // if the option is an INTEGER or NUMBER type, the maximum value permitted
  // integer for INTEGER options, double for NUMBER options
  num? maxValue;

  // if autocomplete interactions are enabled for this STRING, INTEGER, or NUMBER type option
  // assert: autocomplete may not be set to true if choices are present.
  bool? autocomplete;
}

enum ApplicationCommandOptionType {
  // Not for use, there is no type wth value zero
  zeroItem,

  subCommand,

  subCommandGroup,

  string,

  // Any integer between -2^53 and 2^53
  integer,

  boolean,

  user,

  // Includes all channel types + categories
  channel,

  role,

  // Includes users and roles
  mentionable,

  // Any double between -2^53 and 2^53
  number,
}

// https://discord.com/developers/docs/interactions/application-commands#application-command-object-application-command-option-choice-structure
class ApplicationCommandOptionChoice {
  ApplicationCommandOptionChoice({required this.name, required this.value});
  // 1-100 character choice name
  final String name;

  // value of the choice, up to 100 characters if string
  // string, integer, or double
  // TODO: Figure out how to represent string, integer, or double
  // - maybe a union? what is the state of Dart unions?
  final String value;
}
