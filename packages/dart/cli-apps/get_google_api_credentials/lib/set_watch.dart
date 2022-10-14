import 'package:googleapis/gmail/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

Future<void> setWatch(AutoRefreshingAuthClient authClient) async {
  final gmail = GmailApi(authClient);
  final response = await gmail.users.watch(
      WatchRequest(
          topicName: 'projects/the-adventuverse/topics/emails-with-articles'),
      'nick.meinhold@gmail.com');
  print('id: ${response.historyId}, exp: ${response.expiration}');
}
