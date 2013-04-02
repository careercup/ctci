
List<int> sort(List<int> s) {
  List<int> r = new List<int>();
  while (!s.isEmpty) {
    int tmp = s.removeLast();
    while (!r.isEmpty && r.last > tmp) {
      s.add(r.removeLast());
    }
    r.add(tmp);
  }

  return r;
}

void main() {

  List<int> s = new List<int>();
  s.add(3);
  s.add(2);
  s.add(24);
  s.add(34);
  s.add(19);
  s.add(3);
  s.add(4);
  s = sort(s);
  while(!s.isEmpty) {
    print(s.removeLast());
  }

}