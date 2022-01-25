import '../../utils.dart';
import 'notion_block.dart';
import 'notion_child_page.dart';
import 'notion_paragrah.dart';

/// Possible types can be found at https://developers.notion.com/reference/block#block-object-keys
/// TODO: add these:
/// "heading_1", "heading_2", "heading_3",
/// "bulleted_list_item", "numbered_list_item", "to_do", "toggle",
/// "child_database", "embed", "image", "video", "file", "pdf", "bookmark",
/// "callout", "quote", "equation", "divider", "table_of_contents", "column",
/// "column_list", "link_preview", "synced_block", "template", "link_to_page",
/// "table"' "table_row", and "unsupported".
const map = <String, NotionBlock Function(JsonMap)>{
  'paragraph': NotionParagraph.fromJson,
  'child_page': NotionChildPage.fromJson,
};
