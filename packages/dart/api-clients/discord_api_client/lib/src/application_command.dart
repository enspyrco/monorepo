import 'channels.dart';
import 'typedefs.dart';

/// See https://discord.com/developers/docs/interactions/application-commands#application-command-object
///
/// [applicationId], [guildId] & [version] are listed in the docs as part of
/// [ApplicationCommand] but don't seem to be needed here and are kept by the api object.
///
/// [id] is required with a default value of the empty string so that we can create commands
/// without needing to supply an id but we can create from json and have a non-nullable id
class ApplicationCommand {
  ApplicationCommand({
    this.id = '',
    this.type = ApplicationCommandType.chatInput,
    required this.name,
    required this.description,
    List<ApplicationCommandOption>? options,
    this.defaultPermission = true,
  }) {
    _options = options ?? [];
  }

  // unique id of the command	(snowflake)
  // VALID TYPES: all
  final String id;

  // the type of command, defaults 1 if not set
  // VALID TYPES: all
  final ApplicationCommandType type;

  // 1-32 character name
  // VALID TYPES: all
  final String name;

  // 1-100 character description for CHAT_INPUT commands, empty string for USER and MESSAGE commands
  // VALID TYPES: all
  final String description;

  // the parameters for the command, max 25
  // VALID TYPES: CHAT_INPUT
  late final List<ApplicationCommandOption> _options;
  List<ApplicationCommandOption> get options => _options;

  // (default true)	whether the command is enabled by default when the app is added to a guild
  // VALID TYPES: CHAT_INPUT
  final bool defaultPermission;

  void addStringOption({
    required String name,
    required String description,
    bool required = false,
    List<JsonMap>? choices,
    List<ApplicationCommandOption>? options,
    List<ChannelType>? channelTypes,
    num? minValue,
    num? maxValue,
    bool? autocomplete,
  }) {
    _options.add(ApplicationCommandOption(
        type: ApplicationCommandOptionType.string,
        name: name,
        description: description,
        required: required,
        choices: choices,
        options: options,
        channelTypes: channelTypes,
        minValue: minValue,
        maxValue: maxValue,
        autocomplete: autocomplete));
  }

  void addBooleanOption({
    required String name,
    required String description,
    bool required = false,
    List<JsonMap>? choices,
    List<ApplicationCommandOption>? options,
    List<ChannelType>? channelTypes,
    num? minValue,
    num? maxValue,
    bool? autocomplete,
  }) {
    _options.add(ApplicationCommandOption(
        type: ApplicationCommandOptionType.boolean,
        name: name,
        description: description,
        required: required,
        choices: choices,
        options: options,
        channelTypes: channelTypes,
        minValue: minValue,
        maxValue: maxValue,
        autocomplete: autocomplete));
  }

  JsonMap toJson() {
    var json = {
      'type': type.index,
      'name': name,
      'description': description,
      'options': options.map((e) => e.toJson()).toList(),
      'defaultPermission': defaultPermission,
    };

    if (id.isNotEmpty) json['id'] = id;

    return json;
  }
}

class ChatCommand extends ApplicationCommand {
  ChatCommand({
    required String name,
    required String description,
  }) : super(
            type: ApplicationCommandType.chatInput,
            name: name,
            description: description);
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
    List<JsonMap>? choices,
    List<ApplicationCommandOption>? options,
    List<ChannelType>? channelTypes,
    this.minValue,
    this.maxValue,
    this.autocomplete,
  }) {
    _choices = choices ?? [];
    _options = options ?? [];
    _channelTypes = channelTypes ?? [];
  }

  // the type of option
  final ApplicationCommandOptionType type;

  // 1-32 character name
  final String name;

  // 1-100 character description
  final String description;

  // if the parameter is required or optional--default false
  final bool required;

  // choices for STRING, INTEGER, and NUMBER types for the user to pick from, max 25
  late final List<JsonMap> _choices;
  List<JsonMap> get choices => _choices;

  // if the option is a subcommand or subcommand group type, these nested options will be the parameters
  late final List<ApplicationCommandOption> _options;
  List<ApplicationCommandOption> get options => _options;

  // if the option is a channel type, the channels shown will be restricted to these types
  late final List<ChannelType> _channelTypes;
  List<ChannelType> get channelTypes => _channelTypes;

  // if the option is an INTEGER or NUMBER type, the minimum value permitted
  // integer for INTEGER options, double for NUMBER options
  final num? minValue;

  // if the option is an INTEGER or NUMBER type, the maximum value permitted
  // integer for INTEGER options, double for NUMBER options
  final num? maxValue;

  // if autocomplete interactions are enabled for this STRING, INTEGER, or NUMBER type option
  // assert: autocomplete may not be set to true if choices are present.
  final bool? autocomplete;

  JsonMap toJson() {
    var json = {
      'type': type.index,
      'name': name,
      'description': description,
      'required': required,
      'choices': choices
          .map((e) => {'name': e.keys.first, 'value': e.keys.last})
          .toList(),
      'options': options.map((e) => e.toJson()).toList(),
      'channelTypes': channelTypes.map((e) => e.index).toList(),
    };

    if (minValue != null) json['minValue'] = minValue!;
    if (maxValue != null) json['maxValue'] = maxValue!;
    if (autocomplete != null) json['autocomplete'] = autocomplete!;

    return json;
  }
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
// class ApplicationCommandOptionChoice {
//   ApplicationCommandOptionChoice({required this.name, required this.value});
//   // 1-100 character choice name
//   final String name;

//   // value of the choice, up to 100 characters if string
//   // string, integer, or double
//   // TODO: Figure out how to represent string, integer, or double
//   // - maybe a union? what is the state of Dart unions?
//   final Object value;

//   JsonMap toJson() => {'name': name, 'value': value};
// }
