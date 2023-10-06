import 'dart:io';
import 'dart:math';

import 'package:maze_front/maze_front.dart';

void showMazeInfo() {
  for (var element in MazeElements.values) {
    print('${element.object} : ${element.name}');
  }
  print('');
}

void showMazeHeader(Maze maze, {Point<int>? personagePoint}) {
  print("\x1B[2J\x1B[0;0H");
  print('Maze ${maze.size}x${maze.size}\n');
  print('\nPersonage position: ${maze.personagePosition}');
  showMazeInfo();

  maze.show(personagePoint);

  if (personagePoint == null) {
    print('1. Find minimal path');
    print('0. Back\n');
  }
}

Future<void> showMazeMenu(Maze maze) async {
  num? menuIndex;

  while (menuIndex != 0) {
    showMazeHeader(maze);

    stdout.write('\nSelect an option: ');

    menuIndex = num.tryParse(stdin.readLineSync() ?? '');

    switch (menuIndex) {
      case 1:
        await showMinimalPath(maze);
        break;
      case 0:
        break;
      default:
        print('\nInvalid option\n');
        await Future.delayed(const Duration(seconds: 1));
    }
    print(menuIndex);
  }
}

Point<int> receiveDestinationPoint(num mazeSize) {
  int row, column;
  do {
    print('');
    stdout.write('Enter the destination row (between 0 and ${mazeSize - 1}): ');
    row = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  } while (row < 0 || row >= mazeSize);

  do {
    print('');
    stdout.write(
        'Enter the destination column (between 0 and ${mazeSize - 1}): ');
    column = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  } while (column < 0 || column >= mazeSize);

  return Point(row, column);
}

Future<void> showMinimalPath(Maze maze) async {
  var destinationPoint = receiveDestinationPoint(maze.size);

  var minimalPath = await solvePath(
    maze.id,
    maze.personagePosition,
    destinationPoint,
  );
  print(minimalPath);
  if (minimalPath == null) {
    print('No path found');
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  for (var point in minimalPath.points) {
    showMazeHeader(maze, personagePoint: point);
    print('');
    await Future.delayed(const Duration(milliseconds: 700));
  }
}

({num size, num obstacleDensity}) receiveMazeDefs() {
  print('');

  num? mazeSize;
  do {
    stdout.write('Enter maze size (between 0 and 64): ');
    mazeSize = int.tryParse(stdin.readLineSync() ?? '');
  } while (mazeSize == null || mazeSize < 0 || mazeSize > 64);

  print('');

  num? obstacleDensity;
  do {
    stdout.write('Enter obstacle density (between 0 and 1): ');
    obstacleDensity = num.tryParse(stdin.readLineSync() ?? '');
  } while (
      obstacleDensity == null || obstacleDensity < 0 || obstacleDensity > 1);

  return (size: mazeSize, obstacleDensity: obstacleDensity);
}
