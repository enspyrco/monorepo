import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

const pckString =
    '0d1eec8d297df3dd1da292791d1f6cc71c7cf98e05e733217f7dac754dfceb93';

bool validSignature(String body, Map<String, String> headers) {
  String signature = headers['X-Signature-Ed25519']!;
  String timestamp = headers['X-Signature-Timestamp']!;

  var pck = ed.PublicKey(hex.decode(pckString));
  var msg = utf8.encode(timestamp + body);
  var sig = hex.decode(signature);

  return ed.verify(pck, msg as Uint8List, sig as Uint8List);
}
