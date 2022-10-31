import 'package:astro_types/state_types.dart';

class TeamMember implements AstroState {
  const TeamMember({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.photoURL,
  });

  final String uid;
  final String firstName;
  final String lastName;
  final String displayName;
  final String photoURL;

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
