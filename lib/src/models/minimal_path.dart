import 'dart:math';

class MinimalPath {
  final List<Point<int>> points;
  final int cost;

  MinimalPath({
    required this.points,
    required this.cost,
  });

  factory MinimalPath.fromMap(Map<String, dynamic> map) {
    return MinimalPath(
      points: List<Point<int>>.from(
        map['minimalPath'].map(
          (item) => Point<int>(item[0], item[1]),
        ),
      ),
      cost: map['cost'],
    );
  }
}
