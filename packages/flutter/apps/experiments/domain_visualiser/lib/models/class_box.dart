import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'domain_object.dart';

class ClassBox extends DomainObject implements AstroState {
  static const String className = 'ClassBox';

  ClassBox({
    this.type = ClassBox.className,
    required this.id,
    this.flightTime,
    this.userId,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    this.name,
    required this.staticMethods,
    required this.instanceMethods,
    required this.staticVariables,
    required this.instanceVariables,
  });

  /// Used for deserializing a [DomainObject] as the correct type.
  @override
  final String type;

  /// The id of the ClassBox
  @override
  final String id;

  /// The round trip time
  final int? flightTime;

  /// The id of the user that created the ClassBox
  final String? userId;

  /// X,Y positions of the sides
  final double left;
  final double top;
  final double right;
  final double bottom;

  /// Metadata for the ClassBox
  final String? name;
  final Set<String> staticMethods;
  final Set<String> instanceMethods;
  final Set<String> staticVariables;
  final Set<String> instanceVariables;

  factory ClassBox.fromJson(JsonMap json) => ClassBox(
        type: json['type'] as String,
        id: json['id'] as String,
        flightTime: json['flightTime'] as int?,
        userId: json['userId'] as String?,
        left: json['left'] as double,
        top: json['top'] as double,
        right: json['right'] as double,
        bottom: json['bottom'] as double,
        name: json['name'] as String?,
        staticMethods: {
          ...(json['staticMethods'] as List? ?? []).cast<String>()
        },
        instanceMethods: {
          ...(json['instanceMethods'] as List? ?? []).cast<String>()
        },
        staticVariables: {
          ...(json['staticVariables'] as List? ?? []).cast<String>()
        },
        instanceVariables: {
          ...(json['instanceVariables'] as List? ?? []).cast<String>()
        },
      );

  @override
  JsonMap toJson() => {
        'type': type,
        'id': id,
        'flightTime': flightTime,
        'userId': userId,
        'left': left,
        'top': top,
        'right': right,
        'bottom': bottom,
        'name': name,
        'staticMethods': [...staticMethods],
        'instanceMethods': [...instanceMethods],
        'staticVariables': [...staticVariables],
        'instanceVariables': [...instanceVariables],
      };

  @override
  ClassBox copyWith({
    String? type,
    String? id,
    int? flightTime,
    String? userId,
    double? left,
    double? top,
    double? right,
    double? bottom,
    String? name,
    Set<String>? staticMethods,
    Set<String>? instanceMethods,
    Set<String>? staticVariables,
    Set<String>? instanceVariables,
  }) =>
      ClassBox(
        type: type ?? this.type,
        id: id ?? this.id,
        flightTime: flightTime ?? this.flightTime,
        userId: userId ?? this.userId,
        left: left ?? this.left,
        top: top ?? this.top,
        right: right ?? this.right,
        bottom: bottom ?? this.bottom,
        name: name ?? this.name,
        staticMethods: staticMethods ?? this.staticMethods,
        instanceMethods: instanceMethods ?? this.instanceMethods,
        staticVariables: staticVariables ?? this.staticVariables,
        instanceVariables: instanceVariables ?? this.instanceVariables,
      );
}
