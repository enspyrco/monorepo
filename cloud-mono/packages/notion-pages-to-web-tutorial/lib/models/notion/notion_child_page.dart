import 'package:notion_pages_to_web_tutorial/models/notion/notion_block.dart';

import '../../utils.dart';

class NotionChildPage extends NotionBlock {
  /// Plain text of page title.
  final String title;

  NotionChildPage.fromJson(JsonMap json)
      : title = (json['title'] ?? '') as String,
        super(json);
}
