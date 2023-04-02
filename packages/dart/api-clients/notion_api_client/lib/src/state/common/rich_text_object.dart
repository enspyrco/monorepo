import 'package:api_client_utils/types.dart';
import 'package:notion_api_client/src/exceptions.dart';
import 'package:notion_api_client/src/state/pages/property_value_object.dart';

import '../users/user_object.dart';

// RichText -> Text, Mention, Equation
//   - Text
//   - Mention -> User, Page, Database, Date, Link Preview
//   - Equation

class RichTextObject {
  RichTextObject._(JsonMap json)
      : plainText = json['plainText'] as String,
        href = json['href'] as String?,
        annotations =
            AnnotationsObject.fromJson(json['annotations'] as JsonMap),
        type = json['type'] as String;

// plain_text	string	The plain text without annotations.	"Avocado Lovelace"
  final String plainText;

// href	string (optional)	The URL of any link or internal Notion mention in this text, if any.	"https://www.notion.so/Avocado-d093f1d200464ce78b36e58a3f0d8043"
  final String? href;

// annotations	object	All annotations that apply to this rich text. Annotations include colors and bold/italics/underline/strikethrough.
  final AnnotationsObject annotations;

// type	string (enum)	Type of this rich text object. Possible values are: "text", "mention", "equation".	"text"
  final String type;

  factory RichTextObject.fromJson(JsonMap json) {
    if (json['type'] == 'text') {
      return TextObject.fromJson(json);
    }
    throw UnrecognizedTypeInJsonException(
        'RichTextObject.fromJson', json['type'], json);
  }
}

class AnnotationsObject {
  // bold	boolean	Whether the text is bolded.	true
  final bool bold;

  // italic	boolean	Whether the text is italicized.	true
  final bool italic;

  // strikethrough	boolean	Whether the text is struck through.	false
  final bool strikethrough;

  // underline	boolean	Whether the text is underlined.	false
  final bool underline;

  // code	boolean	Whether the text is code style.	true
  final bool code;

  // color	string (enum)	Color of the text. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".	"green"
  final String color;

  AnnotationsObject.fromJson(JsonMap json)
      : bold = json['bold'] as bool,
        italic = json['italic'] as bool,
        strikethrough = json['strikethrough'] as bool,
        underline = json['underline'] as bool,
        code = json['code'] as bool,
        color = json['color'] as String;
}

class TextObject extends RichTextObject {
  // content	string	Text content. This field contains the actual content of your text and is probably the field you'll use most often.	"Avocado Lovelace"
  final String content;

  // link	object (optional)	Any inline link in this text. See link objects.
  final LinkObject? link;

  TextObject.fromJson(JsonMap json)
      : content = json['content'] as String,
        link = LinkObject.fromJson(json['link'] as JsonMap),
        super._(json);
}

class LinkObject {
  // Text link objects contain a type key whose value is always "url" and a url key whose value is a web address.

  String get type => 'url';
  final String url;

  LinkObject.fromJson(JsonMap json) : url = json['url'] as String;
}

class MentionObject extends RichTextObject {
  MentionObject._(JsonMap json) : super._(json);
  // type	string (enum)	Type of the inline mention. Possible values include: "user", "page", "database", "date", "link_preview".	"user"
  MentionObject.fromJson(JsonMap json) : super._(json);
}

// User mentions
// User mentions contain a user object within the user property.
class UserMentionObject extends MentionObject {
  final UserObject user;
  UserMentionObject.fromJson(JsonMap json)
      : user = UserObject.fromJson(json['user'] as JsonMap),
        super._(json);
}

// Page mentions
// Page mentions contain a page reference within the page property. A page reference is an object with an id property, with a string value (UUIDv4) corresponding to a page ID.
// If an integration does not have access to the mentioned page, the mention will be returned with just the ID but without detailed information (title will appear as "Unititled" and annotations will be default).
class PageMentionObject extends MentionObject {
  final PageReference page;
  PageMentionObject.fromJson(JsonMap json)
      : page = PageReference.fromJson(json['page'] as JsonMap),
        super._(json);
}

class PageReference {
  final String id;
  PageReference.fromJson(JsonMap json) : id = json['id'] as String;
}

// Database mentions
// Database mentions contain a database reference within the database property. A database reference is an object with an id property, with a string value (UUIDv4) corresponding to a database ID.
// If an integration does not have access to the mentioned database, the mention will be returned with just the ID but without detailed information (title will appear as "Unititled" and annotations will be default).
class DatabaseMentionObject extends MentionObject {
  final DatabaseReference database;
  DatabaseMentionObject.fromJson(JsonMap json)
      : database = DatabaseReference.fromJson(json['database'] as JsonMap),
        super._(json);
}

class DatabaseReference {
  final String id;
  DatabaseReference.fromJson(JsonMap json) : id = json['id'] as String;
}

// Date mentions
// Date mentions contain a date property value object within the date property.
class DateMentionObject extends MentionObject {
  final DatePropertyValueObject date;
  DateMentionObject.fromJson(JsonMap json)
      : date = DatePropertyValueObject.fromJson(json['date'] as JsonMap),
        super._(json);
}

// Template mentions
// Template mentions represent mentions within a template button or page that refer to a date or user upon duplication.

// Template mentions contain a template_mention object with a nested type key that can be either "template_mention_date" or "template_mention_user".

// If the type key is "template_mention_date", the template mention will contain the following property:

// Property	Type	Description	Example value
// template_mention_date	string (enum)	Type of the date mention. Possible values include: "today" and "now".	"today"
// If the type key is "template_mention_user", the template mention will contain the following property:

// Property	Type	Description	Example value
// template_mention_user	string (enum)	Type of the user mention. The only possible value is "me".	"me"