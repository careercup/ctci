import 'dart:math';

class Color {
  static const Black = 0;
  static const White = 1;
  static const Red = 2;
  static const Yellow = 3;
  static const Green = 4;
  int value;
  Color(this.value);
}

String PrintColor(Color c) {
  switch(c.value){
    case Color.Black:
      return "B";
    case Color.White:
      return "W";
    case Color.Red:
      return "R";
    case Color.Yellow:
      return "Y";
    case Color.Green:
      return "G";
  }

  return "X";
}

void PrintScreen(List<List<Color>> screen) {
  StringBuffer sb = new StringBuffer();
  for (int i = 0; i < screen.length; i++) {
    for (int j = 0; j < screen[0].length; j++) {
      sb.write(PrintColor(screen[i][j]));
    }
    print(sb.toString());
    sb.clear();
  }
}

Random rnd = new Random();
int randomInt(int n) {
  return rnd.nextInt(n);
}

bool PaintFill(List<List<Color>> screen, int x, int y, Color ocolor, Color ncolor) {
  if (x < 0 || x >= screen[0].length || y < 0 || y >= screen.length) {
    return false;
  }

  if (screen[y][x].value == ocolor.value) {
    screen[y][x] = ncolor;
    PaintFill(screen, x - 1, y, ocolor, ncolor); // left
    PaintFill(screen, x + 1, y, ocolor, ncolor); // right
    PaintFill(screen, x, y - 1, ocolor, ncolor); // top
    PaintFill(screen, x, y + 1, ocolor, ncolor); // bottom
  }

  return true;
}

bool PaintFillWithColor(List<List<Color>> screen, int x, int y, Color ncolor) {
  if (screen[y][x] == ncolor) {
    return false;
  }

  return PaintFill(screen, x, y, screen[y][x], ncolor);
}


void main() {
  int N = 10;
  List<List<Color>> screen = new List<List<Color>>(N);
  for (int i = 0; i < N; i++) {
    screen[i] = new List<Color>(N);
  }

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      screen[i][j] = new Color(Color.Black);
    }
  }

  for (int i = 0; i < 100; i++) {
    screen[randomInt(N)][randomInt(N)] = new Color(Color.Green);
  }

  PrintScreen(screen);
  PaintFillWithColor(screen, 2, 2, new Color(Color.White));
  print("");
  PrintScreen(screen);

}