import '../redaux.dart';

abstract class State {
  State copyWith();
}

abstract class RootState extends State {
  List<ErrorMessage> errorMessages = [];
  @override
  RootState copyWith({List<ErrorMessage>? errorMessages});
}
