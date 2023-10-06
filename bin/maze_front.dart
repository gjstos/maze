import 'dart:io';

import 'package:maze_front/maze_front.dart';

import 'maze_handler.dart';

void main(List<String> arguments) async {
  num? menuIndex;
  Maze? maze;

  while (menuIndex != 0) {
    print("\x1B[2J\x1B[0;0H");
    print('Welcome to Minimal Path Maze\n');
    print('1. New maze');
    print('0. Exit\n');
    stdout.write('Select an option: ');
    menuIndex = num.tryParse(stdin.readLineSync() ?? '');

    switch (menuIndex) {
      case 1:
        var mazeDefs = receiveMazeDefs();
        maze = await genMaze(mazeDefs.size, mazeDefs.obstacleDensity);
        if (maze == null) {
          print('\nError generating maze\n');
          await Future.delayed(const Duration(seconds: 2));
          break;
        }
        await showMazeMenu(maze);
        break;
      case 0:
        print('\nBye!\n');
        break;
      default:
        print('\nInvalid option\n');
        await Future.delayed(const Duration(seconds: 1));
    }
  }

  // maze = await genMaze(3, 0);
  // if (maze != null) {
  //   await showMinimalPath(maze);
  // }
}
