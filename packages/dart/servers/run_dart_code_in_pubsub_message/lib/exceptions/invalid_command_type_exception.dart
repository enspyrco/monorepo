import '../enums/application_command_type.dart';

class InvalidCommandTypeException implements Exception {
  const InvalidCommandTypeException({
    required this.expecting,
    required this.found,
  });

  final ApplicationCommandType expecting;
  final int found;

  @override
  String toString() {
    return 'We expected ${expecting.name}, which has value ${expecting.value} but found value $found';
  }
}
