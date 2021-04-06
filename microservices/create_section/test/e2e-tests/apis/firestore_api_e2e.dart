import 'dart:convert';

import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:test/test.dart';

final enspyrTesterId = 'ayl3FcuCUVUmwpDGAvwI47ujyY32';

void main() {
  group('FirestoreApi', () {
    test('successfully retrieve user credentials doc', () async {
      final adcClient =
          await clientViaApplicationDefaultCredentials(scopes: []);

      final documentName =
          'projects/the-process-tool/databases/(default)/documents/credentials/$enspyrTesterId';

      final firestoreApi = FirestoreApi(adcClient);
      final credentialsDoc =
          await firestoreApi.projects.databases.documents.get(documentName);

      final jsonMap = credentialsDoc.fields!['google']!.toJson();

      print(json.encode(jsonMap));
    });
  });
}
