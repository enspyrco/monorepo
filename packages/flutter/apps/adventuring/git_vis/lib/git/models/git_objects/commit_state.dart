import 'package:astro_types/state_types.dart';

class CommitState implements AstroState {
  const CommitState({required this.hash});

  final String hash;

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
