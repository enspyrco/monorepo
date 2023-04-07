// Extract the interaction info from the json in the message
import 'package:run_dart_code_in_pubsub_message/interaction_data.dart';

import '../enums/application_command_type.dart';
import '../exceptions/invalid_command_type_exception.dart';
import '../exceptions/malformed_json_exception.dart';
import '../typedefs.dart';

InteractionData extractMessageCommandInfo(JsonMap json) {
  final data = json['data'] as JsonMap? ??
      (throw MalformedJsonException('Missing "data" key.', json));

  final commandType = data['type'] as int? ??
      (throw MalformedJsonException(
          'Missing "type" key in "data" value.', json));

  // We are currently only handling command type 3 (MESSAGE)
  if (commandType != ApplicationCommandType.message.value) {
    throw InvalidCommandTypeException(
        expecting: ApplicationCommandType.message, found: commandType);
  }

  final resolved = data['resolved'] as JsonMap? ??
      (throw MalformedJsonException(
          'Missing "resolved" key in "data" value.', json));

  final messages = resolved['messages'] as JsonMap? ??
      (throw MalformedJsonException(
          'Missing "messages" key in "resolved" value.', json));

  if (messages.values.isEmpty) {
    throw MalformedJsonException('"messages" should not be empty.', json);
  }

  final firstMessage = messages.values.first as JsonMap;

  final content = firstMessage['content'] as String? ??
      (throw MalformedJsonException(
          'Missing "content" key in first value of "messages" object.', json));

  final String applicationId = json['application_id'] as String? ??
      (throw MalformedJsonException(
          'Missing "application_id" key in first value of "messages" object.',
          json));

  final String token = json['token'] as String? ??
      (throw MalformedJsonException(
          'Missing "token" key in first value of "messages" object.', json));

  return InteractionData(
      content: content, applicationId: applicationId, token: token);
}
