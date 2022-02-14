import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

bool validSignature(String body, Map<String, String> headers) {
  final pckString = Platform.environment['DISCORD_PUBLIC_KEY']!;

  String signature = headers['X-Signature-Ed25519']!;
  String timestamp = headers['X-Signature-Timestamp']!;

  var pck = ed.PublicKey(hex.decode(pckString));
  var msg = utf8.encode(timestamp + body);
  var sig = hex.decode(signature);

  return ed.verify(pck, msg as Uint8List, sig as Uint8List);
}
