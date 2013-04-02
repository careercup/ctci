
int computeByteNum(int width, int x, int y) {
  return (width * y + x) ~/ 8;
}

void drawLine(List<int> screen, int width, int x1, int x2, int y) {
  int start_offset = x1 % 8;
  int first_full_byte = x1 ~/ 8;
  if (start_offset != 0) {
    first_full_byte++;
  }

  int end_offset = x2 % 8;
  int last_full_byte = x2 ~/ 8;
  if (end_offset != 7) {
    last_full_byte--;
  }

  // Set full bytes
  for (int b = first_full_byte; b <= last_full_byte; b++) {
    screen[(width ~/ 8) * y + b] = 0xff;
  }

  int start_mask = 0xff >> start_offset;
  int end_mask = ~(0xff >> (end_offset + 1));

  // Set start and end of line
  if ((x1 ~/ 8) == (x2 ~/ 8)) { // If x1 and x2 are in the same byte
    int mask = start_mask & end_mask;
    screen[(width ~/ 8) * y + (x1 ~/8)] |= mask;
  } else {
    if (start_offset != 0) {
      int byte_number = (width ~/ 8) * y + first_full_byte - 1;
      screen[byte_number] |= start_mask;
    }

    if (end_offset != 7) {
      int byte_number = (width ~/ 8) * y + last_full_byte + 1;
      screen[byte_number] |= end_mask;
    }
  }
}

String printByte(int b) {
  StringBuffer sb = new StringBuffer();
  for (int i = 7; i >= 0; i--) {
    sb.write((b>>i)&1);
  }

  return sb.toString();
}

void printScreen(List<int> screen, int width) {
  int height = screen.length * 8 ~/ width;
  StringBuffer sb = new StringBuffer();
  for (int r = 0; r < height; r++) {
    for (int c = 0; c < width; c+=8) {
      int b = screen[computeByteNum(width, c, r)];
      sb.write(printByte(b));
    }
    print(sb.toString());
    sb.clear();
  }
}

void main() {
  int width = 8 * 4;
  int height = 15;
  List<int> screen = new List<int>(width * height ~/ 8);
  for (int i = 0; i < screen.length; i++) {
    screen[i] = 0;
  }
  //screen [1] = 13;

  drawLine(screen, width, 8, 10, 2);

  printScreen(screen, width);
}