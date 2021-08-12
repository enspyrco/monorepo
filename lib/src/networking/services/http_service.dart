import 'package:http/http.dart' as http;

class HttpService {
  final http.Client _client;

  HttpService({http.Client? client}) : _client = client ?? http.Client();

  Future<void> createSection({required String name}) async {
    final queryParameters = {'name': name};
    final uri = Uri.https(
        'section-creation-v6exb2sdca-uc.a.run.app', '', queryParameters);
    final response = await _client.post(uri);
    if (response.statusCode != 200) {
      throw '${response.statusCode} : ${response.reasonPhrase}';
    }
  }
}
