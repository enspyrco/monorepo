import 'package:shelf/shelf.dart';

void printRequestInfo(Request request, String body) {
  String signature = request.headers['X-Signature-Ed25519']!;
  String timestamp = request.headers['X-Signature-Timestamp']!;
  print('body:\n$body');
  print('signature:\n$signature');
  print('timestamp:\n$timestamp');
}
