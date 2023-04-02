import 'package:api_client_utils/types.dart';
import 'package:notion_api_client/src/exceptions.dart';
import 'package:notion_api_client/src/state/common/rich_text_object.dart';

/// A property_item object describes the identifier, type, and value of a page
/// property. It's returned from the "Retrieve a page property item" endpoint
///
/// Each page property item object contains the following keys.
///
/// In addition,it will contain a key corresponding with the value of type.
/// The value is an object containing type-specific data. The type-specific
/// data are described in the sections below.
class PropertyItemObject {
  PropertyItemObject._(JsonMap json)
      : id = json['id'] as String,
        type = json['type'] as String,
        nextUrl = json['next_url'] as String?;

  /// object	"property_item"	Always "property_item".	"property_item"
  final String object = 'property_item';

  /// Underlying identifier for the property. This identifier is guaranteed to
  /// remain constant when the property name changes. It may be a UUID, but is
  /// often a short random string.
  ///
  /// The id may be used in place of name when creating or updating pages.	"f%5C%5C%3Ap"
  final String id;

  /// Type of the property. Possible values are "rich_text", "number", "select",
  /// "multi_select", "date", "formula", "relation", "rollup", "title",
  /// "people", "files", "checkbox", "url", "email", "phone_number",
  /// "created_time", "created_by", "last_edited_time", and "last_edited_by".
  /// Member Type: string (enum)
  final String type;

  /// Only present in paginated property values (see below) with another page
  /// of results.
  ///
  /// If present, the url the user can request to get the next page of results.
  /// Example: "http://api.notion.com/v1/pages/0e5235bf86aa4efb93aa772cce7eab71/properties/vYdV?start_cursor=LYxaUO&page_size=25"
  /// Wirename: next_url
  final String? nextUrl;

  /// A key corresponding with the value of type.
  /// The value is an object containing type-specific data. The type-specific
  /// data are described in the sections below.

  factory PropertyItemObject.fromJson(JsonMap json) {
    var type = json['type'] as String?;

    if (type == 'title') {
      return TitlePropertyItemObject.fromJson(json);
    }

    throw UnrecognizedTypeInJsonException('PropertyItemObject', type, json);
  }
}

/// The title, rich_text, relation and people property items of are returned as
/// a paginated list object of individual property_item objects in the results.
/// An abridged set of the the properties found in the list object are found
/// below, see the Pagination documentation for additional information.
class PageablePropertyItemsObject {
  PageablePropertyItemsObject._(JsonMap json)
      : results = (json['results'] as List? ?? [])
            .map((e) => PropertyItemObject.fromJson(e as JsonMap))
            .toList(),
        propertyItem =
            PropertyItemObject.fromJson(json['property_item'] as JsonMap);

  /// Always "list".
  final String object = 'list';

  /// Always "property_item".
  final String type = 'property_item';

  /// List of property_item objects.
  /// Example: [{"object": "property_item", "id": "vYdV", "type": "relation", "relation": { "id": "535c3fb2-95e6-4b37-a696-036e5eac5cf6"}}... ]
  final List<PropertyItemObject> results;

  /// A property_item object that describes the property.	{"id": "title", "next_url": null, "type": "title", "title": {}}
  /// Wirename: property_item
  final PropertyItemObject propertyItem;
}

/// Note: The descriptions below sound like a different structure to the json shown in the docs:
/// https://developers.notion.com/reference/property-item-object#title-property-values
/// So I think they should add something like (eg.) "Title property value objects
/// contain a rich text object within the title property (and are part of an
/// array of Title property value objects, under the results key of a Paginated
/// property values object.
/// We have called "Paginated property values objects": [PageablePropertyItemsObject]

/// Title property value objects contain an array of rich text objects within
/// the title property.
///   Note: returned as a paginated list object of individual property_item objects in the results.
class TitlePropertyItemObject extends PropertyItemObject {
  final RichTextObject title;

  TitlePropertyItemObject.fromJson(JsonMap json)
      : title = RichTextObject.fromJson(json['title'] as JsonMap),
        super._(json);
}

/// Rich Text property value objects contain an array of rich text objects within the rich_text property.
///   Note: returned as a paginated list object of individual property_item objects in the results.
class RichTextPropertyItemObject extends PropertyItemObject {
  /// Wirename: rich_text
  final RichTextObject richText;

  RichTextPropertyItemObject.fromJson(JsonMap json)
      : richText = RichTextObject.fromJson(json['rich_text'] as JsonMap),
        super._(json);
}

/// Number property value objects contain a number within the number property.
class NumberPropertyItemObject extends PropertyItemObject {
  final num number;

  NumberPropertyItemObject.fromJson(JsonMap json)
      : number = json['number'] as num,
        super._(json);
}

/// Select property value objects contain the following data within the select property:
class SelectPropertyItemObject extends PropertyItemObject {
  /// ID of the option.
  /// When updating a select property, you can use either name or id.
  ///   Example: "b3d773ca-b2c9-47d8-ae98-3c2ce3b2bffb"
  ///   Type: string (UUIDv4)
  ///   Wirename: id
  final String selectId;

  /// Name of the option as it appears in Notion.
  /// If the select database property does not yet have an option by that name, it will be added to the database schema if the integration also has write access to the parent database.
  /// Note: Commas (",") are not valid for select values.	"Fruit"
  final String name;

  /// Color of the option.
  /// Possible values are: "default", "gray", "brown", "red", "orange", "yellow", "green", "blue", "purple", "pink". Defaults to "default".
  ///   Type:	string (enum)
  ///   Not currently editable.
  ///   Example: "red"
  final String color;

  SelectPropertyItemObject.fromJson(JsonMap json)
      : selectId = (json['select'] as JsonMap)['id'] as String,
        name = (json['select'] as JsonMap)['name'] as String,
        color = (json['select'] as JsonMap)['color'] as String,
        super._(json);
}

/// Multi-select property value objects contain an array of multi-select option values within the multi_select property.
class MultiSelectPropertyItemObject extends PropertyItemObject {
  final List<SelectPropertyItemObject> selections;

  MultiSelectPropertyItemObject.fromJson(JsonMap json)
      : selections = (json['multi_select'] as List)
            .map((e) => SelectPropertyItemObject.fromJson(e as JsonMap))
            .toList(),
        super._(json);

  /// I think we can adequately represent a MultiSelectPropertyItemObject with a
  /// List<SelectPropertyItemObject> but it's not exactly how the docs do it
  /// Docs info is below:

  /// ID of the option.
  /// When updating a multi-select property, you can use either name or id.	"b3d773ca-b2c9-47d8-ae98-3c2ce3b2bffb"
  ///   Type: string (UUIDv4)
  ///   Wirename: id

  /// Name of the option as it appears in Notion.
  /// If the multi-select database property does not yet have an option by that name, it will be added to the database schema if the integration also has write access to the parent database.
  /// Note: Commas (",") are not valid for select values.	"Fruit"
  ///   Type: string
  ///   Wirename: name

  /// Color of the option. Possible values are: "default", "gray", "brown", "red", "orange", "yellow", "green", "blue", "purple", "pink". Defaults to "default".
  /// Not currently editable.
  ///   Example: "red"
  ///   Type: string (enum)
  ///   Wirename: color
}

/// Date property value objects contain the following data within the date property:
class DatePropertyItemObject extends PropertyItemObject {
  /// An ISO 8601 format date, with optional time.	"2020-12-08T12:00:00Z"
  ///   Type: string (ISO 8601 date and time)
  final String start;

  /// An ISO 8601 formatted date, with optional time. Represents the end of a date range.
  /// If null, this property's date value is not a range.	"2020-12-08T12:00:00Z"
  ///   Type: string (optional, ISO 8601 date and time)
  final String? end;

  /// Time zone information for start and end. Possible values are extracted from the IANA database and they are based on the time zones from Moment.js.
  /// When time zone is provided, start and end should not have any UTC offset. In addition, when time zone is provided, start and end cannot be dates without time information.
  /// If null, time zone information will be contained in UTC offsets in start and end.	"America/Los_Angeles"
  ///   Wirename: time_zone
  ///   Type: string (optional, enum)
  final String? timeZone;

  DatePropertyItemObject.fromJson(JsonMap json)
      : start = (json['date'] as JsonMap)['start'] as String,
        end = (json['date'] as JsonMap)['end'] as String?,
        timeZone = (json['date'] as JsonMap)['time_zone'] as String?,
        super._(json);
}

/// Formula property value objects represent the result of evaluating a formula described in the
/// database's properties. These objects contain a type key and a key corresponding with the value of type. The value is an object containing type-specific data. The type-specific data are described in the sections below.
///
/// Subtypes
/// - String formula property values contain an optional string within the string property.
/// - Number formula property values contain an optional number within the number property.
/// - Boolean formula property values contain a boolean within the boolean property.
/// - Date formula property values contain an optional date property value within the date property.

/// Relation property value objects contain an array of relation property items with a pagereferences within the relation property. A page reference is an object with an id property, with a string value (UUIDv4) corresponding to a page ID in another database
///   Note: returned as a paginated list object of individual property_item objects in the results.

/// Rollup property value objects represent the result of evaluating a rollup described in the
/// database's properties. The property is returned as a list object of type property_item with a list of relation items used to computed the rollup under results.
///
/// A rollup property item is also returned under the property_type key that describes the rollup aggregation and computed result.
///
/// In order to avoid timeouts, if the rollup has a with a large number of aggregations or properties the endpoint returns a next_cursor value that is used to determinate the aggregation value so far for the subset of relations that have been paginated through.
///
/// Once has_more is false, then the final rollup value is returned. See the Pagination documentation for more information on pagination in the Notion API.
///
/// Computing the values of following aggregations are not supported. Instead the endpoint returns a list of property_item objects for the rollup:
/// - show_unique (Show unique values)
/// - unique (Count unique values)
/// - median(Median)
///
/// Subtypes
/// - Number rollup property values contain a number within the number property.
/// - Date rollup property values contain a date property value within the date property.
/// - Array rollup property values contain an array of property_item objects within the results property.
/// - Incomplete rollup property values
///   - Rollups with an aggregation with more than one page of aggregated results will return a rollup object of type "incomplete". To obtain the final value paginate through the next values in the rollup using the next_cursor or next_url property.

/// People property value objects contain an array of user objects within the people property.
///   Note: returned as a paginated list object of individual property_item objects in the results.

/// File property value objects contain an array of file references within the files property. A file reference is an object with a File Object and name property, with a string value corresponding to a filename of the original file upload (i.e. "Whole_Earth_Catalog.jpg").

/// Checkbox property value objects contain a boolean within the checkbox property.

/// URL property value objects contain a non-empty string within the url property. The string describes a web address (i.e. "http://worrydream.com/EarlyHistoryOfSmalltalk/").

/// Email property value objects contain a string within the email property. The string describes an email address (i.e. "hello@example.org").

/// Phone number property value objects contain a string within the phone_number property. No structure is enforced.

/// Created time property value objects contain a string within the created_time property. The string contains the date and time when this page was created. It is formatted as an ISO 8601 date time string (i.e. "2020-03-17T19:10:04.968Z").

/// Created by property value objects contain a user object within the created_by property. The user object describes the user who created this page.

/// Last edited time property value objects contain a string within the last_edited_time property. The string contains the date and time when this page was last updated. It is formatted as an ISO 8601 date time string (i.e. "2020-03-17T19:10:04.968Z").

/// Last edited by property value objects contain a user object within the last_edited_by property. The user object describes the user who last updated this page.
