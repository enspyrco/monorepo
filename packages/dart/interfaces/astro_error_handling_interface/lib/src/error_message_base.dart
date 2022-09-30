/// Class for carrying basic error information for display to the user.
abstract class ErrorMessageBase {
  ErrorMessageBase({required this.message, required this.trace});
  final String message;
  final String trace;
}
