import 'package:notion_pages_to_web_tutorial/models/notion/notion_block.dart';

import '../../utils.dart';
import 'notion_block_types.dart' as notion_types;
import 'notion_rich_text.dart';

class NotionParagraph extends NotionBlock {
  /// Rich text in the paragraph block.
  List<NotionRichText> text;

  /// Any nested children blocks of the paragraph block.
  List<NotionBlock> children;

  NotionParagraph.fromJson(JsonMap json)
      : text = ((json['text'] ?? []) as JsonList)
            .cast<JsonMap>()
            .map(NotionRichText.fromJson)
            .toList(),
        children = ((json['text'] ?? []) as JsonList)
            .cast<JsonMap>()
            .map((json) => notion_types.map[json['type']]!(json))
            .toList(),
        super(json);
}
