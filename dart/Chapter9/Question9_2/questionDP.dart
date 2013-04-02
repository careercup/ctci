import '../../utils/assorted_methods.dart';

List<List<int>> maze;

bool isFree(int x, int y) {
  if (maze[x][y] == 0) {
    return false;
  } else {
    return true;
  }
}

bool getPath(int x, int y, List<Point> path, Map<Point, bool> cache) {

  Point p = new Point(x, y);
  if (cache.containsKey(p)) { // Already visited this cell
    return cache[p];
  }

  if (x == 0 && y == 0) {
    return true; // found a path
  }

  bool success = false;
  if (x >= 1 && isFree(x - 1, y)) { // Try right
    success = getPath(x - 1, y, path, cache); // Free! Go right
  }

  if (!success && y >= 1 && isFree(x, y - 1)) { // Try down
    success = getPath(x, y - 1, path, cache);
  }

  if (success) {
    path.add(p); // Right way! Add to path.
  }

  cache[p] = success; // Cache result
  return success;
}

void main() {

  maze = randomMatrix(10, 10, 0, 9);
  printIntMatrix(maze);
  List<Point> path = new List<Point>();
  Map<Point, bool> cache = new Map<Point, bool>();
  bool success = getPath(9, 9, path, cache);
  if (success) {
    String s = listOfPointsToString(path);
    print(s);
  } else {
    print("No path found.");
  }
}