import 'package:maze_front/src/ui/prettier.dart' as prettier;

enum MazeElements {
  wall(-3, prettier.wall),
  personage(-2, prettier.personage),
  obstacle(-1, prettier.obstacle),
  freePath(0, prettier.freePath),
  pathWithWeight1(1, prettier.pathWithWeight1),
  pathWithWeight2(2, prettier.pathWithWeight2),
  pathWithWeight3(3, prettier.pathWithWeight3);

  final int value;
  final String object;

  const MazeElements(this.value, this.object);

  static MazeElements fromValue(int value) {
    return MazeElements.values.firstWhere((e) => e.value == value);
  }

  String get name {
    return switch (this) {
      MazeElements.personage => 'Personage',
      MazeElements.wall => 'Wall',
      MazeElements.obstacle => 'Obstacle',
      MazeElements.freePath => 'Free path',
      MazeElements.pathWithWeight1 => 'Path with weight 1',
      MazeElements.pathWithWeight2 => 'Path with weight 2',
      MazeElements.pathWithWeight3 => 'Path with weight 3',
    };
  }
}
