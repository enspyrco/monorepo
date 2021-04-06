import 'package:googleapis/firestore/v1.dart';
import 'package:create_section/src/extensions/string_extensions.dart';
import 'package:create_section/src/extensions/int_extensions.dart';

Document get basicDoc => Document()
  ..createTime = DateTime.parse('2012-02-27').millisecondsSinceEpoch.toString()
  ..name = 'testName'
  ..updateTime = DateTime.parse('2012-03-27').millisecondsSinceEpoch.toString()
  ..fields = {
    'a': Value()..stringValue = 'string',
    'b': Value()..integerValue = '10'
  };

Document get userCredentialsDoc => Document()
  ..createTime = DateTime.parse('2012-02-27').millisecondsSinceEpoch.toString()
  ..name = 'testName'
  ..updateTime = DateTime.parse('2012-03-27').millisecondsSinceEpoch.toString()
  ..fields = {
    'google': Value()
      ..mapValue = (MapValue()
        ..fields = {
          'access_token': 'access_token'.asValue(),
          'refresh_token': 'refresh_token'.asValue(),
          'expiry_date': 10.asValue(),
          'id_token': 'id_token'.asValue(),
          'token_type': 'token_type'.asValue(),
          'scope': 'scope'.asValue()
        }),
  };

final enspyrTesterFakeCredentialsJson = '''
{createTime: 2021-01-05T11:31:45.446094Z, fields: {google: {mapValue: {fields: {refresh_token: {stringValue: fake_refresh_token}, token_type: {stringValue: Bearer}, id_token: {stringValue: fake_id_token}, scope: {stringValue: https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/documents.readonly openid https://www.googleapis.com/auth/drive.readonly https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/documents}, expiry_date: {integerValue: 1609849902335}, access_token: {stringValue: fake_access_token}}}}, asana: {mapValue: {fields: {access_token: {stringValue: fake_asana_access_token}, expires_in: {integerValue: 3600}, refresh_token: {stringValue: fake_asana_refresh_token}}}}}, name: projects/the-process-tool/databases/(default)/documents/credentials/ayl3FcuCUVUmwpDGAvwI47ujyY32, updateTime: 2021-01-06T12:52:06.855889Z}
''';
