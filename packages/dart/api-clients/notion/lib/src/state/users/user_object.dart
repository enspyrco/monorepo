import 'package:api_client_utils/types.dart';
import 'package:notion_api_client/src/exceptions.dart';

/// Docs: https://developers.notion.com/reference/user

class UserReference {
  final String id;

  UserReference.fromJson(JsonMap json) : id = json['id'] as String;
}

/// These fields are shared by all users, including people and bots. Fields marked with * are always present.

class UserObject {
  UserObject._(JsonMap json)
      : id = json['id'] as String,
        type = json['type'] as String?,
        name = json['name'] as String?,
        avatarUrl = json['avatar_url'] as String?;

  /// *
  /// Always "user"
  /// Type: Display-only
  final String object = 'user';

  /// *
  /// Unique identifier for this user.
  /// Example: "e79a0b74-3aba-4149-9f74-0bb5791a6ee6"
  /// Type: Display-only string (UUID)
  final String id;

  /// Type of the user. Possible values are "person" and "bot".	"person"
  /// Type: Display-only string (optional, enum)
  final String? type;

  /// User's name, as displayed in Notion.
  ///   Type: string (optional)
  ///   Updatable: Display-only
  ///   Example: "Avocado Lovelace"
  final String? name;

  /// Chosen avatar image.
  ///   Type: string (optional)
  ///   Updatable: Display-only
  ///   Example: "https://secure.notion-static.com/e6a352a8-8381-44d0-a1dc-9ed80e62b53d.jpg"
  ///   Wirename: avatar_url
  final String? avatarUrl;

  factory UserObject.fromJson(JsonMap json) {
    var type = json['type'] as String?;

    if (type == null) {
      return PartialUserObject.fromJson(json);
    }
    if (type == 'person') {
      return PersonUserObject.fromJson(json);
    }
    if (type == 'bot') {
      return BotUserObject.fromJson(json);
    }

    throw UnrecognizedTypeInJsonException('UserObject.fromJson', type, json);
  }
}

/// It is not specified outside of being referenced in Block, Comment, Page & Database
/// docs, but a PartialUser object seems to just have `object` = "user" and `id`
///
/// For now we just have a subtype that extends UserObject and assume all nullable
/// members will be null.
class PartialUserObject extends UserObject {
  PartialUserObject.fromJson(JsonMap json) : super._(json);
}

/// User objects that represent people have the type property set to "person".
/// These objects also have the following properties:
class PersonUserObject extends UserObject {
  /// Properties only present for non-bot users.
  ///   Type: object
  ///   Updatable: Display-only
  /// person
  /// Note: the only purpose of the value for 'person' (an object) seems to be to hold person.email

  /// Email address of person. This is only present if an integration has user capabilities that allow access to email addresses.	"avo@example.org"
  ///   Updatable: Display-only
  ///   Type: string
  ///   Wirename: person.email
  final String? email;

  PersonUserObject.fromJson(JsonMap json)
      : email = (json['person'] as JsonMap)['email'] as String?,
        super._(json);
}

/// User objects that represent bots have the type property set to "bot". These objects also have the following properties:
class BotUserObject extends UserObject {
  /// Properties only present for bot users.
  /// If viewing your own bot with GET /v1/users/me or GET /v1/users/{{your_bot_id}}, this field will be populated with more information about the bot.
  ///   Updatable: Display-only
  ///   Type: object
  /// bot

  /// Information about who owns this bot.
  ///   Type: object
  ///   Updatable: Display-only
  /// owner

  ///  	The type of owner - either "workspace" or "user".
  /// 	Type: string enum
  ///   Updatable: Display-only
  ///   Wirename: owner.type
  final String ownerType;

  /// When viewing information about "your own" bot specifically - that is, the bot tied to the API token being used to call the API - the bot property will contain the following additional fields:

  /// Display-only
  ///   Type: boolean
  /// Always true. Only present if owner.type is "workspace".
  ///   Wirename: owner.workspace
  bool? ownerWorkspace;

  ///	A user object describing who owns this bot. Currently only "person" users can own bots.
  /// See the People reference above for more detail. The properties in the user
  /// object are based on the bot capabilities.
  ///   Updatable: Display-only
  ///   Type: object
  ///   Example: { "object": "user", "id": "cb38e95d-00cf-4e7e-adce-974f4a44a547", "name": "Ada Lovelace", "avatar_url": null, "type": "person", "person": { "email": "ada@makenotion.com" } }
  UserObject? ownerUser;

  BotUserObject.fromJson(JsonMap json)
      : ownerType =
            ((json['bot'] as JsonMap)['owner'] as JsonMap)['type'] as String,
        ownerWorkspace = ((json['bot'] as JsonMap)['owner']
            as JsonMap)['workspace'] as bool?,
        ownerUser =
            ((json['bot'] as JsonMap)['owner'] as JsonMap)['user'] == null
                ? null
                : UserObject.fromJson(((json['bot'] as JsonMap)['owner']
                    as JsonMap)['user'] as JsonMap),
        super._(json);
}
