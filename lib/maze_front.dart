import 'dart:math';

import 'src/models/maze.dart';
import 'src/models/minimal_path.dart';
import 'src/service/maze_service.dart';
import 'src/ui/prettier.dart' as prettier;

export 'src/models/maze.dart';
export 'src/models/maze_elements.dart';
export 'src/models/minimal_path.dart';

final _repository = MazeService();

final monkey = prettier.personage;

Future<Maze?> genMaze(num size, num obstacleDensity) async {
  try {
    return _repository.genMaze(size, obstacleDensity);
  } catch (e) {
    print(e);
    return null;
  }
}

Future<MinimalPath?> solvePath(
  String mazeId,
  Point<int> from,
  Point<int> to,
) async {
  try {
    return _repository.solvePath(mazeId, from, to);
  } catch (e) {
    print(e);
    return null;
  }
}
