import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User, ReduxModel {
  factory User({required String id, required String displayName}) = _User;

  factory User.fromJson(JsonMap json) => _$UserFromJson(json);
}
