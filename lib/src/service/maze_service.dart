import 'dart:math';

import 'package:dio/dio.dart';

import '../models/maze.dart';
import '../models/minimal_path.dart';

class MazeService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3032/map-solver',
      contentType: 'application/json',
    ),
  );

  Future<Maze?> genMaze(num size, num obstacleDensity) async {
    return await _dio.post(
      '/generate',
      data: {
        'size': size,
        'obstacleDensity': obstacleDensity,
      },
    ).then<Maze?>((response) {
      if (response.data == null) {
        return null;
      }
      return Maze.fromMap(response.data);
    });
  }

  Future<MinimalPath?> solvePath(
    String mazeId,
    Point<int> from,
    Point<int> to,
  ) async {
    return await _dio.post(
      '/find-minimum-path',
      data: {
        'id': mazeId,
        'startingPosition': {
          'x': from.x,
          'y': from.y,
        },
        'endPosition': {
          'x': to.x,
          'y': to.y,
        }
      },
    ).then<MinimalPath?>((response) => MinimalPath.fromMap(response.data));
  }
}
