import 'dart:async';
import 'dart:isolate';

Future<String> evaluate(String codeString) async {
  final uri = Uri.dataFromString(
    '''
    import 'dart:isolate';

    void main(_, SendPort port) {
      port.send($codeString);
    }
    ''',
    mimeType: 'application/dart',
  );

  Isolate? isolate;
  ReceivePort? port;
  String response;

  port = ReceivePort();

  try {
    isolate =
        await Isolate.spawnUri(uri, [], port.sendPort, onError: port.sendPort);

    try {
      var result = await port.timeout(Duration(seconds: 5)).first;
      response = result.toString();
    } on TimeoutException catch (e) {
      response = e.toString();
    }
  } catch (e) {
    response = e.toString();
  } finally {
    port.close();
    isolate?.kill();
  }

  return response;
}
