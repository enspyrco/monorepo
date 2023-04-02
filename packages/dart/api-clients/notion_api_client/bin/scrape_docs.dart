import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

void main(List<String> arguments) async {
  final client = http.Client();

  final response = await client
      .get(Uri.parse('https://developers.notion.com/reference/status-codes'));

  if (response.statusCode == 200) {
    var document = parse(response.body);
    final List<Element> tables = document.getElementsByTagName('table');

    // this is a dirty hacky solution that will break as soon as the page changes at all
    final errorsTableBody = tables.last.children.last;

    final List<StatusCode> statusCodes = [];
    for (var row in errorsTableBody.children) {
      statusCodes.add(StatusCode.fromElement(row));
    }
    // `recursive` will create missing files and folders
    final output =
        await io.File("scraped/api-description/http_status_messages.json")
            .create(recursive: true);
    await output.writeAsString(jsonEncode(statusCodes));
    log('Scraped docs and output json for http status messages.');
    client.close();
  } else {
    client.close();
    throw response.statusCode;
  }
}

class StatusCode {
  StatusCode._({
    required String httpStatusCode,
    required String code,
    required String message,
  })  : _httpStatusCode = int.parse(httpStatusCode),
        _code = code.replaceAll('/"', ''),
        _message = message;

  factory StatusCode.fromElement(Element element) => StatusCode._(
        httpStatusCode: element.children.first.text,
        code: element.children.elementAt(1).text,
        message: element.children.last.innerHtml,
      );

  final int _httpStatusCode;
  final String _code;
  final String _message;

  @override
  String toString() {
    return 'http_status_code: $_httpStatusCode\n'
        'code: $_code\n'
        'message: $_message\n';
  }

  Map<String, Object> toJson() => {
        'httpStatusCode': _httpStatusCode,
        'code': _code,
        'message': _message,
      };
}
