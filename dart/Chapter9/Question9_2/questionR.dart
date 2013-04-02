import '../../utils/assorted_methods.dart';

List<List<int>> maze;

bool isFree(int x, int y) {
  if (maze[x][y] == 0) {
    return false;
  } else {
    return true;
  }
}

bool getPath(int x, int y, List<Point> path) {

  Point p = new Point(x, y);
  if (x == 0 && y == 0) {
    return true; // found a path
  }

  bool success = false;
  if (x >= 1 && isFree(x - 1, y)) { // Try right
    success = getPath(x - 1, y, path);
  }

  if (!success && y >= 1 && isFree(x, y - 1)) { // Try down
    success = getPath(x, y - 1, path); // Free! Go down
  }

  if (success) {
    path.add(p); // Right way! Add to path.
  }

  return success;
}

void initMaze() {
  maze = new List<List<int>>(10);
  for (int i = 0; i < maze.length; i++) {
    maze[i] = new List<int>(10);
    for (int j = 0; j < maze[i].length; j++) {
      maze[i][j] = 0;
    }
  }
}

void main() {
  //initMaze();
  maze = randomMatrix(10, 10, 0, 4);
  printIntMatrix(maze);
  List<Point> path = new List<Point>();

  bool success = getPath(9, 9, path);

  if (success) {
    String s = listOfPointsToString(path);
    print(s);
  } else {
    print("No path found.");
  }
}