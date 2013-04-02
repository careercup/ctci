

class Box {
  int width;
  int height;
  int depth;
  Box(this.width, this.height, this.depth);

  bool canBeUnder(Box b) {
    if (width > b.width && height > b.height && depth > b.depth) {
      return true;
    }

    return false;
  }

  bool canBeAbove(Box b) {
    if (b == null) {
      return true;
    }

    if (width < b.width && height < b.height && depth < b.depth) {
      return true;
    }

    return false;
  }

  String toString() => "Box($width, $height, $depth)";
}

int stackHeight(List<Box> boxes) {
  if (boxes == null) {
    return 0;
  }

  int h = 0;
  for (Box b in boxes) {
    h += b.height;
  }

  return h;
}

List<Box> createStackR(List<Box> boxes, Box bottom) {
  int max_height = 0;
  List<Box> max_stack = null;
  for (int i = 0; i < boxes.length; i++) {
    if (boxes[i].canBeAbove(bottom)) {
      List<Box> new_stack = createStackR(boxes, boxes[i]);
      int new_height = stackHeight(new_stack);
      if (new_height > max_height) {
        max_stack = new_stack;
        max_height = new_height;
      }
    }
  }

  if (max_stack == null) {
    max_stack = new List<Box>();
  }

  if (bottom != null) {
    if (max_stack.length >= 1) {
      max_stack[0] = bottom;
    } else {
      max_stack.add(bottom);
    }
  }

  return max_stack;
}


List<Box> createStackDP(List<Box> boxes, Box bottom, Map<Box, List<Box>> stack_map) {
  if (bottom != null && stack_map.containsKey(bottom)) {
    return stack_map[bottom];
  }

  int max_height = 0;
  List<Box> max_stack = null;
  for (int i = 0; i < boxes.length; i++) {
    if (boxes[i].canBeAbove(bottom)) {
      List<Box> new_stack = createStackDP(boxes, boxes[i], stack_map);
      int new_height = stackHeight(new_stack);
      if (new_height > max_height) {
        max_stack = new_stack;
        max_height = new_height;
      }
    }
  }

  if (max_stack == null) {
    max_stack = new List<Box>();
  }

  if (bottom != null) {
    if (max_stack.length >= 1) {
      max_stack[0] = bottom;
    } else {
      max_stack.add(bottom);
    }
  }

  if (bottom != null) {
    stack_map[bottom] = max_stack;
  }

  return new List<Box>.from(max_stack);
}

void main() {
  List<Box> boxes = [ new Box(1, 7, 4), new Box(2, 6, 9), new Box(4, 9, 6), new Box(10, 12, 8),
                      new Box(6, 2, 5), new Box(3, 8, 5), new Box(5, 7, 7), new Box(2, 10, 16), new Box(12, 15, 9)];

  List<Box> stack1 = createStackDP(boxes, null, new Map<Box, List<Box>>());
  List<Box> stack2 = createStackR(boxes, null);
  for (int i = stack1.length - 1; i >= 0; i--) {
    Box b = stack1[i];
    print(b.toString());
  }
  for (int i = stack2.length - 1; i >= 0; i--) {
    Box b = stack2[i];
    print(b.toString());
  }
}