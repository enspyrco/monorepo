import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'domain_object.dart';

part 'class_box.freezed.dart';
part 'class_box.g.dart';

@freezed
class ClassBox extends DomainObject with _$ClassBox, ReduxState {
  static const String className = 'ClassBox';

  const ClassBox._();
  const factory ClassBox({
    /// Used for deserializing a [DomainObject] as the correct type.
    /// Leave as the default.
    @Default('ClassBox') String? type,

    /// The id of the ClassBox
    required String id,

    /// The round trip time
    int? flightTime,

    /// The id of the user that created the ClassBox
    String? userId,

    /// X,Y positions of the sides
    required double left,
    required double top,
    required double right,
    required double bottom,

    /// Metadata for the ClassBox
    String? name,
    ISet<String>? staticMethods,
    ISet<String>? instanceMethods,
    ISet<String>? staticVariables,
    ISet<String>? instanceVariables,
  }) = _ClassBox;

  factory ClassBox.fromJson(JsonMap json) => _$ClassBoxFromJson(json);

  @override
  String get typeName => className;
}
