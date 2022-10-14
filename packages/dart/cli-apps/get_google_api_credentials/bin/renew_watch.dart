import 'package:get_google_api_credentials/create_auth_client.dart';
import 'package:get_google_api_credentials/set_watch.dart';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var httpClient = http.Client();
  var authClient = createAuthClient(httpClient);

  await setWatch(authClient);

  httpClient.close();
  authClient.close();
}
