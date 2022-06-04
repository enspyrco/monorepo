import 'package:api_client_utils/types.dart';
import 'package:notion_api_client/src/state/common/file_object.dart';
import 'package:notion_api_client/src/state/common/file_or_emoji_object.dart';

import '../../exceptions.dart';
import '../common/rich_text_object.dart';
import '../users/user_object.dart';

class BlockObject {
  BlockObject._(JsonMap json)
      : id = json['id'] as String,
        type = json['type'] as String,
        createdTime = json['created_time'] as String,
        createdBy = UserObject.fromJson(json['created_by'] as JsonMap),
        lastEditedTime = json['last_edited_time'] as String,
        lastEditedBy = UserObject.fromJson(json['last_edited_by'] as JsonMap),
        archived = json['archived'] as bool,
        hasChildren = json['has_children'] as bool;

  // object*	string	Always "block".	"block"
  final String object = 'block';

  // id*	string (UUIDv4)	Identifier for the block.	"7af38973-3787-41b3-bd75-0ed3a1edfac9"
  final String id;

  // type	string (enum)	Type of block. Possible values include "paragraph", "heading_1", "heading_2", "heading_3", "bulleted_list_item", "numbered_list_item", "to_do", "toggle", "child_page","child_database", "embed", "image", "video", "file", "pdf", "bookmark", "callout", "quote", "equation", "divider", "table_of_contents", "column", "column_list", "link_preview", "synced_block", "template", "link_to_page", "table"' "table_row", and "unsupported".	"paragraph"
  final String type;

  // created_time	string (ISO 8601 date time)	Date and time when this block was created. Formatted as an ISO 8601 date time string.	"2020-03-17T19:10:04.968Z"
  final String createdTime;

  // created_by	Partial User	User who created the block.	{"object": "user","id": "45ee8d13-687b-47ce-a5ca-6e2e45548c4b"}
  final UserObject createdBy;

  // last_edited_time	string (ISO 8601 date time)	Date and time when this block was last updated. Formatted as an ISO 8601 date time string.	"2020-03-17T19:10:04.968Z"
  final String lastEditedTime;

  // last_edited_by	Partial User	User who last edited the block.	{"object": "user","id": "45ee8d13-687b-47ce-a5ca-6e2e45548c4b"}
  final UserObject lastEditedBy;

  // archived	boolean	The archived status of the block.	false
  final bool archived;

  // has_children	boolean	Whether or not the block has children blocks nested within it.	true
  final bool hasChildren;

  factory BlockObject.fromJson(JsonMap json) {
    var type = json['type'];

    if (type == 'paragraph') {
      return ParagraphBlockObject.fromJson(json);
    }

    throw UnrecognizedTypeInJsonException('BlockObject.fromJson', type, json);
  }
}

class ParagraphBlockObject extends BlockObject {
  /// Rich text in the paragraph block.
  /// Wirename: rich_text
  /// Type: Array of rich text objects
  final List<RichTextObject> richText;

  ///	Color of the block. Possible values are: "default", "gray", "brown",
  /// "orange", "yellow", "green", "blue", "purple", "pink", "red",
  /// "gray_background", "brown_background", "orange_background",
  /// "yellow_background", "green_background", "blue_background",
  /// "purple_background", "pink_background", "red_background".
  /// Type: string (enum)
  final String color;

  /// Any nested children blocks of the paragraph block.
  /// Type: Array of block objects
  final List<BlockObject> children;

  ParagraphBlockObject.fromJson(JsonMap json)
      : richText = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        color = json['color'] as String,
        children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Heading one block objects contain the following information within the heading_1 property:
class HeadingOneBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	Rich text in the heading block.
  final List<RichTextObject> richTexts;

  /// Color of the block.
  /// Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  ///   Type: string (enum)
  final String color;

  HeadingOneBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        color = json['color'] as String,
        super._(json);
}

/// Heading two block objects contain the following information within the heading_2 property:
class HeadingTwoBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	Rich text in the heading block.
  final List<RichTextObject> richTexts;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  HeadingTwoBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        color = json['color'] as String,
        super._(json);
}

/// Heading three block objects contain the following information within the heading_3 property:
class HeadingThreeBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	Rich text in the heading block.
  final List<RichTextObject> richTexts;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  HeadingThreeBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        color = json['color'] as String,
        super._(json);
}

/// Callout block objects contain the following information within the callout property:
class CalloutBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	Rich text in the heading block.
  final List<RichTextObject> richTexts;

  /// Page icon.
  ///   Type: File Object or Emoji object
  final FileOrEmojiObject? icon;

  ///	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  ///   Type: string (enum)
  final String color;

  ///	Any nested children blocks of the callout block.
  ///   Type: array of block objects
  final List<BlockObject> children;

  CalloutBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        icon = FileOrEmojiObject.fromJson(json),
        color = json['color'] as String,
        children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Quote block objects contain the following information within the quote property
class QuoteBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	Rich text in the quote block.
  final List<RichTextObject> richTexts;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  /// children	array of block objects	Any nested children blocks of the quote block.
  final List<BlockObject> children;

  QuoteBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        color = json['color'] as String,
        children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Bulleted list item block objects contain the following information within the bulleted_list_item property:
class BulletedListItemBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	Rich text in the bulleted_list_item block.
  final List<RichTextObject> richTexts;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  /// children	array of block objects	Any nested children blocks of the bulleted_list_item block.
  final List<BlockObject> children;

  BulletedListItemBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        color = json['color'] as String,
        children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Numbered list item block objects contain the following information within the numbered_list_item property:
class NumberedListItemBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	Rich text in the numbered_list_item block.
  final List<RichTextObject> richTexts;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  /// children	array of block objects	Any nested children blocks of the numbered_list_item block.
  final List<BlockObject> children;

  NumberedListItemBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        color = json['color'] as String,
        children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// To do block objects contain the following information within the to_do property:
class ToDoBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	Rich text in the to_do block.
  final List<RichTextObject> richTexts;

  /// checked	boolean (optional)	Whether the to_do is checked or not.
  final bool? checked;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  /// children	array of block objects	Any nested children blocks of the to_do block.
  final List<BlockObject> children;

  ToDoBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        checked = json['checked'] as bool?,
        color = json['color'] as String,
        children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Toggle block objects contain the following information within the toggle property:
class ToggleBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	Rich text in the toggle block.
  final List<RichTextObject> richTexts;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  /// children	array of block objects	Any nested children blocks of the toggle block.
  final List<BlockObject> children;

  ToggleBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        color = json['color'] as String,
        children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Code block objects contain the following information within the code property:
class CodeBlockObject extends BlockObject {
  /// rich_text	array of Rich text object text objects	Rich text in code block
  final List<RichTextObject> richTexts;

  /// caption	array of Rich text object text objects	Rich text in caption of the code block
  final List<RichTextObject> caption;

  /// language	string (enum)
  /// Type of block. Possible values include:
  /// "abap", "arduino", "bash", "basic", "c", "clojure", "coffeescript", "c++", "c#", "css", "dart", "diff", "docker", "elixir", "elm", "erlang", "flow", "fortran", "f#", "gherkin", "glsl", "go", "graphql", "groovy", "haskell", "html", "java", "javascript", "json", "julia", "kotlin", "latex", "less", "lisp", "livescript", "lua", "makefile", "markdown", "markup", "matlab", "mermaid", "nix", "objective-c", "ocaml", "pascal", "perl", "php", "plain text", "powershell", "prolog", "protobuf", "python", "r", "reason", "ruby", "rust", "sass", "scala", "scheme", "scss", "shell", "sql", "swift", "typescript", "vb.net", "verilog", "vhdl", "visual basic", "webassembly", "xml", "yaml", and "java/c/c++/c#"
  final String language;

  CodeBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        caption = (json['caption'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        language = json['language'] as String,
        super._(json);
}

/// Child page block objects contain the following information within the child_page property:
class ChildPageBlockObject extends BlockObject {
  /// title	string	Plain text of page title.
  final String title;

  ChildPageBlockObject.fromJson(JsonMap json)
      : title = json['title'] as String,
        super._(json);
}

/// Child database block objects contain the following information within the child_database property:
class ChildDatabaseBlockObject extends BlockObject {
  /// title	string	Plain text of the database title
  final String title;

  ChildDatabaseBlockObject.fromJson(JsonMap json)
      : title = json['title'] as String,
        super._(json);
}

/// Embed blocks include block types that allow displaying another website within Notion.
class EmbedBlockObject extends BlockObject {
  /// url	string	Link to website the embed block will display.
  final String url;

  EmbedBlockObject.fromJson(JsonMap json)
      : url = json['url'] as String,
        super._(json);
}

/// Image blocks
/// Includes supported image urls (i.e. ending in .png, .jpg, .jpeg, .gif, .tif, .tiff, .bmp, .svg, or .heic)
class ImageBlockObject extends BlockObject {
  /// image	File Object	Image file reference
  final FileObject image;

  ImageBlockObject.fromJson(JsonMap json)
      : image = FileObject.fromJson(json['image'] as JsonMap),
        super._(json);
}

/// Video blocks
/// Includes supported video urls (e.g. ending in .mkv, .flv, .gifv, .avi, .mov, .qt, .wmv, .asf, .amv, .mp4, .m4v, .mpeg, .mpv, .mpg, .f4v, etc.)
class VideoBlockObject extends BlockObject {
  /// video	File Object	Video file reference
  final FileObject video;

  VideoBlockObject.fromJson(JsonMap json)
      : video = FileObject.fromJson(json['video'] as JsonMap),
        super._(json);
}

/// File blocks
class FileBlockObject extends BlockObject {
  /// file	File Object	File reference
  final FileObject file;

  /// caption	array of Rich text object text objects	Caption of the file block
  final List<RichTextObject> caption;

  FileBlockObject.fromJson(JsonMap json)
      : file = FileObject.fromJson(json['file'] as JsonMap),
        caption = (json['caption'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        super._(json);
}

/// PDF blocks
class PdfBlockObject extends BlockObject {
  /// pdf	File Object	PDF file reference
  final FileObject pdf;

  PdfBlockObject.fromJson(JsonMap json)
      : pdf = FileObject.fromJson(json['pdf'] as JsonMap),
        super._(json);
}

/// Bookmark blocks
class BookmarkBlockObject extends BlockObject {
  /// url	string	Bookmark link
  final String url;

  /// caption	array of Rich text object text objects	Caption of the bookmark block
  final List<RichTextObject> caption;

  BookmarkBlockObject.fromJson(JsonMap json)
      : url = json['url'] as String,
        caption = (json['caption'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Equation blocks
class EquationBlockObject extends BlockObject {
  /// expression	string	A KaTeX compatible string
  final String expression;

  EquationBlockObject.fromJson(JsonMap json)
      : expression = json['expression'] as String,
        super._(json);
}

/// Divider blocks
class DividerBlockObject extends BlockObject {
  /// Divider block objects do not contain any information within the divider property
  DividerBlockObject.fromJson(JsonMap json) : super._(json);
}

/// Table of contents blocks
class TableOfContentsBlockObject extends BlockObject {
  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  TableOfContentsBlockObject.fromJson(JsonMap json)
      : color = json['color'] as String,
        super._(json);
}

/// Breadcrumb blocks
class BreadcrumbBlockObject extends BlockObject {
  /// Breadcrumb block objects do not contain any information within the breadcrumb property
  BreadcrumbBlockObject.fromJson(JsonMap json) : super._(json);
}

/// Column List and Column Blocks
///
/// Column Lists are parent blocks for column children. They do not contain any information within the column_list property and can only contain children of type column.
/// Columns are parent blocks for any supported block children, excluding columns. They do not contain any information within the column property. They can only be appended to column_lists.
/// When creating a column list block via Append block children, the column_list must have at least 2 columns, and those columns must have at least one child each.
/// When fetching content for a column_list, first fetch the the column children via Retrieve block children. Then fetch the children for each column block.

/// Column List blocks contain the following information in the column_list property:
class ColumnListBlockObject extends BlockObject {
  /// children	array of column_list block objects	List of columns in the column_list block.
  final List<ColumnBlockObject> children;

  ColumnListBlockObject.fromJson(JsonMap json)
      : children = (json['children'] as List)
            .map((e) => ColumnBlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Column blocks contain the following information in the column property.
class ColumnBlockObject extends BlockObject {
  /// children	array of block objects	List of blocks in a single column.
  final List<BlockObject> children;

  ColumnBlockObject.fromJson(JsonMap json)
      : children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Link Preview blocks
/// NOTE: The link_preview block will only be returned as part of a response. It cannot be created via the API.
class LinkPreviewBlockObject extends BlockObject {
  /// Link Preview block objects return the originally pasted url.
  final String url;

  LinkPreviewBlockObject.fromJson(JsonMap json)
      : url = json['url'] as String,
        super._(json);
}

/// Template block objects contain the following information within the template property:
class TemplateBlockObject extends BlockObject {
  /// rich_text	array of rich text objects	rich text in the title of the template
  final List<RichTextObject> richTexts;

  /// children	array of block objects	Any nested children blocks of the template block. These blocks will be duplicated when the template block is used in the UI.
  final List<BlockObject> children;

  TemplateBlockObject.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Link to page objects contain a key corresponding with the value of type. The value is a type-specific string as described below.
class LinkToPageBlockObject extends BlockObject {
  /// Type of this link to page object.
  ///   string (enum) Possible values are: "page_id", "database_id".
  ///   Example: "page_id"
  ///   Wirename: type
  final String linkType;

  /// Identifier for a page
  ///   Type: string (UUIDv4)
  ///   Example: "7af38973-3787-41b3-bd75-0ed3a1edfac9"
  ///   Wirename: page_id
  final String pageId;

  /// Identifier for a database page
  ///   Type: string (UUIDv4)
  ///   Example: "7af38973-3787-41b3-bd75-0ed3a1edfac9"
  ///   Wirename: database_id
  final String databaseId;

  LinkToPageBlockObject.fromJson(JsonMap json)
      : linkType = json['type'] as String,
        pageId = json['page_id'] as String,
        databaseId = json['database_id'] as String,
        super._(json);
}

/// Synced Block blocks
///
/// Similar to the UI, there are two versions of a synced_block -- the original block that was created first and doesn't yet sync with anything else, and the reference blocks that are synced to the original synced block.

/// Original Synced Block
/// To create a synced_block, the developer needs to create an original synced block. Developers will be able to identify the original synced_block because it does not "sync_from" any other block (synced_from property is set to null).
/// This is an example of an "original" synced_block. Note that all of the blocks available to be synced in another synced_block are captured in the children property.
/// "Original" synced block objects contain the following information within the synced_block property:
class OriginalSyncedBlockObject extends BlockObject {
  /// synced_from	null	Value is always null to signify that this is an original synced block and that is not referring to another block
  final SyncedFromBlockObject? syncedFrom = null;

  /// children	array of block objects	Any nested children blocks of the synced_block block. These blocks will be synced across this block and references to this synced_block
  final List<BlockObject> children;

  OriginalSyncedBlockObject.fromJson(JsonMap json)
      : children = (json['children'] as List)
            .map((e) => BlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Reference Synced Blocks
/// To sync the content of the original synced_block with another synced_block, the developer simply needs to refer to that synced_block using the synced_from property.
/// Below is an example of a synced_block referring to another synced_block. Note that only "original" synced blocks can be referenced in the synced_from property.
/// "References" synced block objects contain the following information within the synced_block property:
class ReferenceSyncedBlockObject extends BlockObject {
  /// synced_from	Synced From Object	Object that contains the id of the original synced_block
  final SyncedFromBlockObject syncedFrom;

  ReferenceSyncedBlockObject.fromJson(JsonMap json)
      : syncedFrom =
            SyncedFromBlockObject.fromJson(json['synced_from'] as JsonMap),
        super._(json);
}

/// Synced From Object
/// Synced From objects contain a key corresponding with the value of type. The value is a type-specific string as described below.
class SyncedFromBlockObject extends BlockObject {
  /// Type of this synced from object.
  ///   Type: string (enum) Possible values are: "block_id".
  ///   Wirename: type
  ///   Example: "block_id"
  final String syncedFromType;

  /// Identifier of an original synced_block
  ///   Wirename: block_id
  ///   Type: string (UUIDv4)
  ///   Example: "7af38973-3787-41b3-bd75-0ed3a1edfac9"
  final String blockId;

  SyncedFromBlockObject.fromJson(JsonMap json)
      : syncedFromType = json['ty[e'] as String,
        blockId = json['block_id'] as String,
        super._(json);
}

/// Table blocks
///
/// Tables are parent blocks for table row children. They can only contain children of type table_row.
/// When creating a table block via the Append block children endpoint, the table must have at least 1 table_row whose cells array has the same length as the table_width.
///
/// To fetch content for a table, fetch the the table_row children via Retrieve block children. The table block itself only contains formatting data, no content.

/// Table blocks contain the following within the table property:
class TableBlockObject extends BlockObject {
  /// table_width	integer	Number of columns in the table. Note that this cannot be changed via the public API once a table is created.	3
  final int tableWidth;

  /// has_column_header	boolean	Whether or not the table has a column header. If true, the first row in the table will appear visually distinct from the other rows.	false
  final bool hasColumnHeader;

  /// has_row_header	boolean	Whether or not the table has a header row. If true, the first column in the table will appear visually distinct from the other columns.	false
  final bool hasRowHeader;

  /// children	array of table_row block objects	List of table_row children for this table.	[{"type": "table_row","table_row": {"cells": [[{"type": "text","text": {"content": "column 1 content"},"plain_text": "column 1 content"}]]}}]
  final List<TableRowBlockObject> children;

  TableBlockObject.fromJson(JsonMap json)
      : tableWidth = json['table_width'] as int,
        hasColumnHeader = json['has_column_header'] as bool,
        hasRowHeader = json['has_row_header'] as bool,
        children = (json['children'] as List)
            .map((e) => TableRowBlockObject.fromJson(e))
            .toList(),
        super._(json);
}

/// Table row blocks contain the following within the table_row property:
class TableRowBlockObject extends BlockObject {
  /// cells	array of array of Rich text objects	Array of cell contents in horizontal display order. Each cell itself is an array of rich text objects.	[
  /// Example: [{"type": "text","text": {"content": "simple","link": null},"annotations": {"bold": false,"italic": false,"strikethrough": false,"underline": false,"code": false,"color": "default"},"plain_text": "simple","href": null}]]
  final List<RichTextObject> cells;

  TableRowBlockObject.fromJson(JsonMap json)
      : cells = (json['cells'] as List)
            .map((e) => RichTextObject.fromJson(e))
            .toList(),
        super._(json);
}
