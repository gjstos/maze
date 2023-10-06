import 'dart:math';

import 'maze_elements.dart';

class Maze {
  final String id;
  final List<List<MazeElements>> maze;
  final num size;
  Point<int> personagePosition = Point(0, 0);

  Maze({
    required this.id,
    required this.maze,
    required this.size,
  });

  factory Maze.fromMap(Map<String, dynamic> map) {
    print(map);
    var maze = List<List<MazeElements>>.from(
      map['map'].map(
        (item) => List<MazeElements>.from(
          item.map((x) => MazeElements.fromValue(x)),
        ),
      ),
    );

    return Maze(
      id: map['mazeId'],
      maze: maze,
      size: map['size'],
    );
  }

  void show([Point<int>? personagePoint]) {
    if (personagePoint != null) {
      personagePosition = personagePoint;
    }
    var newMaze = maze.addPersonage(personagePosition).addWalls();
    print('');
    for (var list in newMaze) {
      var str = '';
      for (var item in list) {
        str += item.object;
      }
      print(str);
    }
    print('');
  }
}

extension _MazeExtension on List<List<MazeElements>> {
  List<List<MazeElements>> addPersonage(Point<int> point) {
    final newMaze = map((list) => List<MazeElements>.from(list)).toList();

    newMaze[point.x][point.y] = MazeElements.personage;

    return newMaze;
  }

  List<List<MazeElements>> addWalls() {
    final newMaze = map((list) => List<MazeElements>.from(list)).toList();

    for (var row in newMaze) {
      row.insert(0, MazeElements.wall);
      row.add(MazeElements.wall);
    }

    final width = newMaze[0].length;
    final wall = List<MazeElements>.filled(width, MazeElements.wall);

    newMaze.insert(0, wall);
    newMaze.add(wall);

    return newMaze;
  }
}
