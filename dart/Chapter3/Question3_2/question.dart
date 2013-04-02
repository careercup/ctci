import 'dart:math' as Math;
import '../../utils/assorted_methods.dart';

class NodeWithMin {
  int value;
  int min;
  NodeWithMin(this.value, this.min);
}

class StackWithMin {

  List _list;
  StackWithMin(): _list = new List();

  push(int value) {

    var m = this.min();
    int newMin = value;
    if (m != null) {
      newMin = Math.min(value, this.min());
    }

    _list.add(new NodeWithMin(value, newMin));
  }

  NodeWithMin pop() => _list.removeLast();
  int min() {
    if (_list.isEmpty) {
      return null;
    } else {
      return _list.last.min;
    }
  }

}

class StackWithMin2 {
  List _s2;
  List _list;
  StackWithMin2() : _s2 = new List<int>(), _list = new List();

  void push(int value) {

    var m = this.min();
    if (m != null) {
      if (value <= m) {
        _s2.add(value);
      }
    }

    _list.add(value);
  }

  int pop() {
    int value = _list.removeLast();
    if (value == this.min()) {
      _s2.removeLast();
    }

    return value;
  }

  int min() {
    if (_s2.isEmpty) {
      return null;
    } else {
      return _s2.last;
    }
  }
}

void main() {

  StackWithMin stack = new StackWithMin();
  StackWithMin2 stack2 = new StackWithMin2();
  StringBuffer sb = new StringBuffer();
  for (int i = 0; i < 15; i++) {
    int value = randomIntInRange(0, 100);
    stack.push(value);
    stack2.push(value);
    sb.write("$value, ");
  }
  print(sb.toString());
  print("");
  sb.clear();
  for (int i = 0; i < 15; i++) {
    print("Popped ${stack.pop().value} , ${stack2.pop()}");
    print("New min is ${stack.min()}, ${stack2.min()}");
  }
}