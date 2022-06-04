import 'package:api_client_utils/types.dart';

import '../../exceptions.dart';
import 'file_or_emoji_object.dart';

const fromJsonFor = {
  'file': NotionFileObject.fromJson,
  'external': ExternalFileObject.fromJson
};

/// File objects contain data about files uploaded to Notion as well as external files linked in Notion.

/// Each file object contains the following keys. In addition, it must contain a key corresponding with the value of type. The value is an object containing type-specific configuration. The type-specific configurations are described in the sections below.

class FileObject with FileOrEmojiObject {
  FileObject._(JsonMap json) : type = json['type'] as String;

  /// 	Type of this file object. Possible values are: "external", "file".
  ///   Wirename: {type}
  ///   Type: string (enum)
  @override
  final String type;

  factory FileObject.fromJson(JsonMap json) {
    var type = json['type'];
    var fromJson = fromJsonFor[type];
    if (fromJson == null) {
      throw UnrecognizedTypeInJsonException('FileObject', type, json);
    }
    return fromJson(json);
  }
}

/// For files and URLs hosted outside of Notion, we support retrieving the link as well as updating it to a different link. We don't currently support uploading files to Notion through the API, however, for files already uploaded to Notion, we support retrieving the file URL. The table below details what's supported for Embed, Image, Video, Audio, and File blocks, as well as page icon and page cover image properties.
////////////////////////////////////////////////////
/// Name	                          Retrieve	Create
/// Link to externally hosted file	Yes	      Yes
/// File uploaded to Notion	        Yes	      No
////////////////////////////////////////////////////

/// All files hosted by Notion have a type of "file".
/// File objects contain the following information within the file property:
class NotionFileObject extends FileObject {
  /// Authenticated S3 URL to the file. The file URL will be valid for 1 hour but updated links can be requested if required.
  ///   Example: "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/9bc6c6e0-32b8-4d55-8c12-3ae931f43a01/brocolli.jpeg?..."
  final String url;

  /// Date and time when this will expire. Formatted as an ISO 8601 date time string.
  ///   Wirename: expiry_time
  ///   Type: string (ISO 8601 date time)
  ///   Example: "2020-03-17T19:10:04.968Z"
  final String expiryTime;

  NotionFileObject.fromJson(JsonMap json)
      : url = json['url'] as String,
        expiryTime = json['expiry_time'] as String,
        super._(json);
}

/// All external file objects have a type of "external".
/// An external file is any URL that isn't hosted by Notion.
/// External file objects contain the following information within the external property:
class ExternalFileObject extends FileObject {
  /// Link to the externally hosted content.
  ///   Example: "https://website.domain/files/doc.txt"
  final String url;

  ExternalFileObject.fromJson(JsonMap json)
      : url = json['url'] as String,
        super._(json);
}
