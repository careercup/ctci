import '../../utils/assorted_methods.dart';

class RankNode {
  int left_size = 0;
  RankNode left;
  RankNode right;
  int data = 0;
  RankNode(this.data);

  void insert(int d) {
    if (d <= data) {
      if (left != null) {
        left.insert(d);
      } else {
        left = new RankNode(d);
      }
      left_size++;
    } else {
      if (right != null) {
        right.insert(d);
      } else {
        right = new RankNode(d);
      }
    }
  }

  int getRank(int d) {
    if (d == data) {
      return left_size;
    } else if (d < data) {
      if (left == null) {
        return -1;
      } else {
        return left.getRank(d);
      }
    } else {
      int right_rank = right == null ? -1 : right.getRank(d);
      if (right_rank == -1) {
        return -1;
      } else {
        return left_size + 1 + right_rank;
      }
    }
  }
}

RankNode root = null;

void track(int number) {
  if (root == null) {
    root = new RankNode(number);
  } else {
    root.insert(number);
  }
}

int getRankOfNumber(int number) {
  root.getRank(number);
}

void main() {
  List<int> list = new List<int>();
  list.add(5);
  for (int i = 0; i < 100; i++) {
    int x = randomIntInRange(0, 100);
    track(x);
  }

  for (int i = 0; i < 100; i++) {
    int rank1 = root.getRank(i);
    print("$i has rank $rank1");
  }
}