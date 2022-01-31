import '../../utils.dart';

abstract class NotionBlock {
  NotionBlock(JsonMap json)
      : type = json['type'] as String,
        id = json['id'] as String,
        createdTime = json['created_time'] as String,
        lastEditedTime = json['last_edited_time'] as String,
        archived = json['archived'] as bool,
        hasChildren = json['has_children'] as bool;

  /// Type of block. (enum)
  String type;

  /// Identifier for the block.	(UUIDv4)
  String id;

  /// Date and time when this block was created. Formatted as an ISO 8601 date time string. (ISO 8601 date time)
  String createdTime;

  ///	Date and time when this block was last updated. Formatted as an ISO 8601 date time string. (ISO 8601 date time)
  String lastEditedTime;

  /// The archived status of the block.
  bool archived;

  /// Whether or not the block has children blocks nested within it.
  bool hasChildren;

  @override
  String toString() => type;
}
