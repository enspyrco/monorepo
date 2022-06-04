import 'package:api_client_utils/types.dart';

import '../../exceptions.dart';

/// Metadata that controls how a database property behaves.
///
/// Each database property object contains the following keys. In addition, it must contain a key corresponding with the value of type. The value is an object containing type-specific configuration. The type-specific configurations are described in the sections below.
class PropertyObject {
  PropertyObject._(JsonMap json)
      : id = json['id'] as String,
        type = json['type'] as String,
        name = json['name'] as String;

  /// id	string	The ID of the property, usually a short string of random letters and symbols.
  /// Some automatically generated property types have special human-readable IDs. For example, all Title properties have an ID of "title".	"fy:{"
  final String id;

  /// type	string (enum)	Type that controls the behavior of the property. Possible values are: "title", "rich_text", "number", "select", "multi_select", "date", "people", "files", "checkbox", "url", "email", "phone_number", "formula", "relation", "rollup", "created_time", "created_by", "last_edited_time", "last_edited_by".	"rich_text"
  final String type;

  /// name	string	The name of the property as it appears in Notion.
  final String name;

  factory PropertyObject.fromJson(JsonMap json) {
    var type = json['type'];

    if (json['type'] == 'title') {
      return TitlePropertyObject.fromJson(json);
    }

    throw UnrecognizedTypeInJsonException('PropertyItemObject', type, json);
  }
}

/// Each database must have exactly one database property of type "title". This database property controls the title that appears at the top of the page when the page is opened. Title database property objects have no additional configuration within the title property.
class TitlePropertyObject extends PropertyObject {
  TitlePropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Text database property objects have no additional configuration within the rich_text property.
class TextPropertyObject extends PropertyObject {
  TextPropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Number database property objects contain the following configuration within the number property:
class NumberPropertyObject extends PropertyObject {
  /// format	string (enum)	How the number is displayed in Notion. Potential values include: number, number_with_commas, percent, dollar, canadian_dollar, euro, pound, yen, ruble, rupee, won, yuan, real, lira, rupiah, franc, hong_kong_dollar, new_zealand_dollar, krona, norwegian_krone, mexican_peso, rand, new_taiwan_dollar, danish_krone, zloty, baht, forint, koruna, shekel, chilean_peso, philippine_peso, dirham, colombian_peso, riyal, ringgit, leu, argentine_peso, uruguayan_peso.	"percent"
  final String format;

  NumberPropertyObject.fromJson(JsonMap json)
      : format = json['format'] as String,
        super._(json);
}

/// Select configuration

/// Select database property objects contain the following configuration within the select property:
class SelectPropertyObject extends PropertyObject {
  /// options	array of select option objects.	Sorted list of options available for this property.
  final List<SelectOptionObject> options;

  SelectPropertyObject.fromJson(JsonMap json)
      : options = (json['options'] as List)
            .map((e) => SelectOptionObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Select options
class SelectOptionObject extends PropertyObject {
  /// name	string	Name of the option as it appears in Notion.
  /// Note: Commas (",") are not valid for select values.	"Fruit"
  final String optionName;

  /// id	string	Identifier of the option, which does not change if the name is changed. These are sometimes, but not always, UUIDs.	"ff8e9269-9579-47f7-8f6e-83a84716863c"
  final String optionId;

  /// color	string (enum)	Color of the option. Possible values include: default, gray, brown, orange, yellow, green, blue, purple, pink, red.	"red"
  final String color;

  SelectOptionObject.fromJson(JsonMap json)
      : optionName = json['name'] as String,
        optionId = json['id'] as String,
        color = json['color'] as String,
        super._(json);
}

/// Multi-select configuration

/// Multi-select database property objects contain the following configuration within the multi_select property:
class MultiSelectPropertyObject extends PropertyObject {
  /// options	array of multi-select option objects.	Settings for multi select properties.
  final List<MultiSelectOptionObject> options;

  MultiSelectPropertyObject.fromJson(JsonMap json)
      : options = (json['options'] as List)
            .map((e) => MultiSelectOptionObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Multi-select options
class MultiSelectOptionObject extends PropertyObject {
  /// name	string	Name of the option as it appears in Notion.
  /// Note: Commas (",") are not valid for select values.	"Fruit"
  @override
  final String name;

  /// id	string	Identifier of the option, which does not change if the name is changed. These are sometimes, but not always, UUIDs.	"ff8e9269-9579-47f7-8f6e-83a84716863c"
  @override
  final String id;

  /// color	string (enum)	Color of the option. Possible values include: default, gray, brown, orange, yellow, green, blue, purple, pink, red.	"red"
  final String color;

  MultiSelectOptionObject.fromJson(JsonMap json)
      : name = json['name'] as String,
        id = json['id'] as String,
        color = json['color'] as String,
        super._(json);
}

/// Date configuration
/// Date database property objects have no additional configuration within the date property.'
class DatePropertyObject extends PropertyObject {
  DatePropertyObject.fromJson(JsonMap json) : super._(json);
}

/// People configuration
/// People database property objects have no additional configuration within the people property.
class PeoplePropertyObject extends PropertyObject {
  PeoplePropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Files configuration
/// Files database property objects have no additional configuration within the files property.
class FilesPropertyObject extends PropertyObject {
  FilesPropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Checkbox configuration
/// Checkbox database property objects have no additional configuration within the checkbox property.
class CheckboxPropertyObject extends PropertyObject {
  CheckboxPropertyObject.fromJson(JsonMap json) : super._(json);
}

/// URL configuration
/// URL database property objects have no additional configuration within the url property.
class UrlPropertyObject extends PropertyObject {
  UrlPropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Email configuration
/// Email database property objects have no additional configuration within the email property.
class EmailPropertyObject extends PropertyObject {
  EmailPropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Phone number configuration
/// Phone number database property objects have no additional configuration within the phone_number property.
class PhoneNumberPropertyObject extends PropertyObject {
  PhoneNumberPropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Formula configuration
/// Formula database property objects contain the following configuration within the formula property:
class FormulaPropertyObject extends PropertyObject {
  /// Formula to evaluate for this property. You can read more about the syntax for formulas in the help center.	"if(prop(\"In stock\"), 0, prop(\"Price\"))"
  final String expression;

  FormulaPropertyObject.fromJson(JsonMap json)
      : expression = json['expression'] as String,
        super._(json);
}

/// Relation configuration
/// Relation database property objects contain the following configuration within the relation property:
class RelationPropertyObject extends PropertyObject {
  /// database_id	string (UUID)	The database this relation refers to. New linked pages must belong to this database in order to be valid.	"668d797c-76fa-4934-9b05-ad288df2d136"
  final String databaseId;

  /// synced_property_name	string (optional)	By default, relations are formed as two synced properties across databases: if you make a change to one property, it updates the synced property at the same time. synced_property_name refers to the name of the property in the related database.	"Ingredients"
  final String? syncedPropertyName;

  /// synced_property_id	string (optional)	By default, relations are formed as two synced properties across databases: if you make a change to one property, it updates the synced property at the same time. synced_property_id refers to the id of the property in the related database. This is usually a short string of random letters and symbols.	"fy:{"
  final String? syncedPropertyId;

  RelationPropertyObject.fromJson(JsonMap json)
      : databaseId = json['database_id'] as String,
        syncedPropertyId = json['synced_property_id'] as String?,
        syncedPropertyName = json['synced_property_name'] as String?,
        super._(json);
}

/// Rollup configuration
/// Rollup database property objects contain the following configuration within the rollup property:
class RollupPropertyObject extends PropertyObject {
  /// relation_property_name	string	The name of the relation property this property is responsible for rolling up.	"Meals"
  final String relationPropertyName;

  /// relation_property_id	string	The id of the relation property this property is responsible for rolling up.	"fy:{"
  final String relationPropertyId;

  /// rollup_property_name	string	The name of the property of the pages in the related database that is used as an input to function.	"Name"
  final String rollupPropertyName;

  /// rollup_property_id	string	The id of the property of the pages in the related database that is used as an input to function.	"fy:{"
  final String rollupPropertyId;

  /// function	string (enum)	The function that is evaluated for every page in the relation of the rollup.
  /// Possible values include: count_all, count_values, count_unique_values, count_empty, count_not_empty, percent_empty, percent_not_empty, sum, average, median, min, max, range, show_original	"count_unique_values"
  final String function;

  RollupPropertyObject.fromJson(JsonMap json)
      : relationPropertyName = json['relation_property_name'] as String,
        relationPropertyId = json['relation_property_id'] as String,
        rollupPropertyName = json['rollup_property_name'] as String,
        rollupPropertyId = json['rollup_property_id'] as String,
        function = json['function'] as String,
        super._(json);
}

/// Created time configuration
/// Created time database property objects have no additional configuration within the created_time property.
class CreatedTimePropertyObject extends PropertyObject {
  CreatedTimePropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Created by configuration
/// Created by database property objects have no additional configuration within the created_by property.
class CreatedByPropertyObject extends PropertyObject {
  CreatedByPropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Last edited time configuration
/// Last edited time database property objects have no additional configuration within the last_edited_time property.
class LastEditedTimePropertyObject extends PropertyObject {
  LastEditedTimePropertyObject.fromJson(JsonMap json) : super._(json);
}

/// Last edited by configuration
// Last edited by database property objects have no additional configuration within the last_edited_by property.
class LastEditedByPropertyObject extends PropertyObject {
  LastEditedByPropertyObject.fromJson(JsonMap json) : super._(json);
}
