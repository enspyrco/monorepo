import 'package:astro_types/state_types.dart';

class BranchState implements AstroState {
  const BranchState({required this.name});

  final String name;

  @override
  AstroState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
