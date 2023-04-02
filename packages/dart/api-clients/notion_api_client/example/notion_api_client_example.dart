import 'package:api_client_utils/api_client_utils.dart';
import 'package:notion_api_client/notion_api_client.dart';

import 'credentials.dart';

void main() async {
  var client = NotionClient(token: token);

  // var page = await client.retrievePageProperties(id: 'e93dda7fa5ed4e28ba27e857cd1f6757');

  try {
    var response = await client.getBlockChildren(
        id: 'e93dda7fa5ed4e28ba27e857cd1f6757'); // f399da8641d8441da3de6a4fd7431567
  } on APIRequestException catch (error) {
    print(error.getJsonValue(key: 'message'));
  } finally {
    client.close();
  }
}
