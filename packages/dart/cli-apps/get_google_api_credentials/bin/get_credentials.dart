import 'package:get_google_api_credentials/obtain_credentials.dart';

/// Get credentials for accessing Google APIs, currently just for setting
/// a watch on the user's GMail - getting credentials for other purposes will
/// be added later
void main(List<String> arguments) async {
  final credentials = await obtainCredentials();
  print('access token:');
  print(credentials.accessToken);
  print('refresh token:');
  print(credentials.refreshToken);
}
