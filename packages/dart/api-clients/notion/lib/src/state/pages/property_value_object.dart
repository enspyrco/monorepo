import 'package:api_client_utils/types.dart';
import 'package:notion_api_client/src/exceptions.dart';

/// Each page property value object contains the following keys. In addition, it
/// contains a key corresponding with the value of type. The value is an object
/// containing type-specific data. The type-specific data are described in the
/// sections below.
class PropertyValueObject {
  PropertyValueObject._(JsonMap json) : id = json['id'] as String;

  /// id	string	Underlying identifier for the property. This identifier is guaranteed to remain constant when the property name changes. It may be a UUID, but is often a short random string.
  /// The id may be used in place of name when creating or updating pages.	"f%5C%5C%3Ap"
  final String id;

  /// type (optional)	string (enum)	Type of the property. Possible values are
  /// "rich_text", "number", "select", "multi_select", "date", "formula",
  /// "relation", "rollup", "title", "people", "files", "checkbox", "url",
  /// "email", "phone_number", "created_time", "created_by", "last_edited_time",
  /// and "last_edited_by".	"rich_text"
  factory PropertyValueObject.fromJson(JsonMap json) {
    if (json['type'] == 'date') {
      return DatePropertyValueObject.fromJson(json);
    }
    throw UnrecognizedTypeInJsonException(
        'PropertyValueObject.fromJson', json['type'], json);
  }
}

/// Date property value objects contain the following data within the date property
class DatePropertyValueObject extends PropertyValueObject {
  /// start	string (ISO 8601 date and time)	An ISO 8601 format date, with optional time.	"2020-12-08T12:00:00Z"
  final String start;

  /// end	string (optional, ISO 8601 date and time)	An ISO 8601 formatted date, with optional time. Represents the end of a date range.
  /// If null, this property's date value is not a range.	"2020-12-08T12:00:00Z"
  final String? end;

  /// time_zone	string (optional, enum)	Time zone information for start and end. Possible values are extracted from the IANA database and they are based on the time zones from Moment.js.
  /// When time zone is provided, start and end should not have any UTC offset. In addition, when time zone is provided, start and end cannot be dates without time information.
  /// If null, time zone information will be contained in UTC offsets in start and end.	"America/Los_Angeles"
  final String? timeZone;

  DatePropertyValueObject.fromJson(JsonMap json)
      : start = json['start'] as String,
        end = json['end'] as String?,
        timeZone = json['time_zone'] as String?,
        super._(json);
}
