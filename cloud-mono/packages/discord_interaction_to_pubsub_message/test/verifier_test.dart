import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:test/test.dart';

void main() {
  //
  test('invalid signature fails', () async {
    var pck = ed.PublicKey(hex.decode(pckString));
    var msg = utf8.encode(timestamp1 + body1);
    var sig = hex.decode(signature1);

    var result = ed.verify(pck, msg as Uint8List, sig as Uint8List);
    expect(result, false);
  });

  //
  test('valid signature passes', () async {
    var pck = ed.PublicKey(hex.decode(pckString));
    var msg = utf8.encode(timestamp2 + body2);
    var sig = hex.decode(signature2);

    var result = ed.verify(pck, msg as Uint8List, sig as Uint8List);
    expect(result, true);
  }, skip: true);
}

// Discord Application Public Key
const pckString =
    '0d1eec8d297df3dd1da292791d1f6cc71c7cf98e05e733217f7dac754dfceb93';

/// invalid test data - this was first sent by Discord and when a 401 was returned another request was sent
/// so I assume this was the 'should return 401' check
var body1 = r'''
{
  "insertId": "61fca1050009801de1934c37",
  "jsonPayload": {
    "version": 1,
    "token": "aW50ZXJhY3Rpb246OTM5MDAzMzUzMzI3ODk0NTU4OnZMRXIxTTFDSlQ3WEJJT0pXQ1c4MlhnS2FjaVI5MmRKUXRUdkJ2c1duQkhKMXIzT05uRmU0NXREYm9JVTJuR002MTFTT29HOFhSWFllVmszT1F0QjJ3aTFhaENDZm9UNUhzd3U0a0Nza1NnY1M0RGRremZqaE5NMThLSkxjb1pt",
    "id": "939003353327894558",
    "user": {
      "username": "nick (meinhold)",
      "public_flags": 0,
      "discriminator": "7938",
      "avatar": "0723275997c1f1fa9a679de056a3eaeb",
      "id": "852151927852892170"
    },
    "application_id": "938746298146885634",
    "type": 1
  },
  "resource": {
    "type": "cloud_run_revision",
    "labels": {
      "project_id": "dart-runner",
      "configuration_name": "dart-runner",
      "revision_name": "dart-runner-00008-vay",
      "location": "us-central1",
      "service_name": "dart-runner"
    }
  },
  "timestamp": "2022-02-04T03:44:05.622621Z",
  "labels": {
    "instanceId": "00bf4bf02d2971f7d6d4c680310624c93f149cd93a793f79e337543a306cd466711e9e052948130989d86cd47a75af0abe318a7f69d9298462ed7a73f2"
  },
  "logName": "projects/dart-runner/logs/run.googleapis.com%2Fstdout",
  "receiveTimestamp": "2022-02-04T03:44:05.907682272Z"
}
''';
var signature1 =
    'ac63d499750eb52b7a95bc88ddc7fdb25537293bf04b83f8666c931dd2dc1c4a2a4d5d31c905ba37b1dce6628d0096afe76801751f108945dbc44b089b14ba00';
var timestamp1 = '1643946245';

/// EDIT: there is something wrong with the test data - maybe whitespace characters in the body?
/// valid test data - this was sent by Discord after a 401 was returned in response to the previous request
/// which resulted in Discord not verifying, so I assume this was the 'should return 200' check
var body2 = '''
{
  "insertId": "61fca105000a98826fb4b697",
  "jsonPayload": {
    "application_id": "938746298146885634",
    "id": "939003353327894559",
    "type": 1,
    "token": "aW50ZXJhY3Rpb246OTM5MDAzMzUzMzI3ODk0NTU5Ok1sUldRSUNXbVVpOEkybXNFbnA3ekFua0lwa0tHUno4RlhTUHhydkVFRXpjQUdyTGVaZlAxbGtUN1B2bmVnYjdsZlBNd3pmbXk5alJoNWYyQTJ1eTljR05YOUlIdVBkNWt5VTFsVmlIWFI2VWxrcDhMTFFURXFXR0JFRHNaYUdU",
    "version": 1,
    "user": {
      "id": "852151927852892170",
      "public_flags": 0,
      "username": "nick (meinhold)",
      "avatar": "0723275997c1f1fa9a679de056a3eaeb",
      "discriminator": "7938"
    }
  },
  "resource": {
    "type": "cloud_run_revision",
    "labels": {
      "revision_name": "dart-runner-00008-vay",
      "configuration_name": "dart-runner",
      "project_id": "dart-runner",
      "location": "us-central1",
      "service_name": "dart-runner"
    }
  },
  "timestamp": "2022-02-04T03:44:05.694402Z",
  "labels": {
    "instanceId": "00bf4bf02d2971f7d6d4c680310624c93f149cd93a793f79e337543a306cd466711e9e052948130989d86cd47a75af0abe318a7f69d9298462ed7a73f2"
  },
  "logName": "projects/dart-runner/logs/run.googleapis.com%2Fstdout",
  "receiveTimestamp": "2022-02-04T03:44:05.907682272Z"
}
''';
var signature2 =
    '5e593b89bbb0ea47514cf71904e93a92a21371e8e985985b901adba06a2167a3dabc447af87320447738e66f56a3fc7587fa2748ea767c2c4489d94c1435fb0d';
var timestamp2 = '1643946245';
