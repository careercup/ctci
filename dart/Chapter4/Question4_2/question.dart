
class Node {
  List<Node> _adjacent;
  int adjacentCount;
  String _vertex;
  int state;

  Node(String vertex, int adjacentLength) {
    this._vertex = vertex;
    adjacentCount = 0;
    _adjacent = new List<Node>(adjacentLength);
  }

  void addAdjacent(Node x) {
    if (adjacentCount < 30) {
      this._adjacent[adjacentCount] = x;
      adjacentCount++;
    } else {
      print("No more adjacent can be added");
    }
  }

  List<Node> getAdjacent() {
    return _adjacent;
  }

  String getVertex() {
    return _vertex;
  }
}

class Graph {
  List<Node> _vertices;
  int count;

  Graph() : _vertices = new List<Node>(6), count = 0;

  void addNode(Node x) {
    if (count < 30) {
      _vertices[count] = x;
      count++;
    } else {
      print("Graph full");
    }
  }

  List<Node> getNodes() {
    return _vertices;
  }
}

class State {
  static const int Unvisited = 0;
  static const int Visited = 1;
  static const int Visiting = 2;
}

Graph createNewGraph() {

  Graph g = new Graph();
  List<Node> temp = new List<Node>(6);

  temp[0] = new Node("a", 3);
  temp[1] = new Node("b", 0);
  temp[2] = new Node("c", 0);
  temp[3] = new Node("d", 1);
  temp[4] = new Node("e", 1);
  temp[5] = new Node("f", 0);

  temp[0].addAdjacent(temp[1]);
  temp[0].addAdjacent(temp[2]);
  temp[0].addAdjacent(temp[3]);
  temp[3].addAdjacent(temp[4]);
  temp[4].addAdjacent(temp[5]);
  for (int i = 0; i < 6; i++) {
    g.addNode(temp[i]);
  }
  return g;
}

bool search(Graph g, Node start,Node end) {
  List<Node> q = new List<Node>();
  for (Node u in g.getNodes()) {
    u.state = State.Unvisited;
  }

  start.state = State.Visited;
  q.add(start);
  Node u;
  while(!q.isEmpty) {
    u = q.removeAt(0);
    if (u != null) {
      for (Node v in u.getAdjacent()) {
        if (v.state == State.Unvisited) {
          if (v == end) {
            return true;
          } else {
            v.state = State.Visiting;
            q.add(v);
          }
        }
      }
      u.state = State.Visited;
    }
  }

  return false;
}

void main() {
  Graph g = createNewGraph();
  List<Node> n = g.getNodes();
  Node start = n[3];
  Node end = n[5];
  print(search(g, start, end));
}