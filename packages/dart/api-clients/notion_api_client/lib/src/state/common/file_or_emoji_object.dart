import 'package:api_client_utils/types.dart';

import 'emoji_object.dart';
import 'file_object.dart';

abstract class FileOrEmojiObject {
  abstract final String type;

  factory FileOrEmojiObject.fromJson(JsonMap json) {
    return (json['type'] == 'emoji')
        ? EmojiObject.fromJson(json)
        : FileObject.fromJson(json);
  }
}
