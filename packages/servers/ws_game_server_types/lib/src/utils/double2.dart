// A data class for sending pairs of doubles (eg. locations) in messages.
class Double2 {
  const Double2(this.x, this.y);
  final num x;
  final num y;

  Map<String, dynamic> toJson() => <String, num>{'x': x, 'y': y};

  factory Double2.fromJson(Map<String, dynamic> json) =>
      Double2(json['x'] as num, json['y'] as num);

  @override
  String toString() => '{x: $x, y: $y}';
}
