
String printBinary(double n) {
  if (n >= 1 || n <= 0) {
    return "ERROR";
  }

  StringBuffer binary = new StringBuffer();
  binary.write(".");
  while (n > 0) {
    /* Setting a limit on length: 32 characters */
    if (binary.length > 32) {
      //return "ERROR";
      return binary.toString();
    }

    double r = n * 2;
    if (r >= 1) {
      binary.write(1);
      n = r - 1;
    } else {
      binary.write(0);
      n = r;
    }
  }

  return binary.toString();
}

String printBinary2(double n) {
  if (n >= 1 || n <= 0) {
    return "ERROR";
  }

  StringBuffer binary = new StringBuffer();
  double frac = 0.5;
  binary.write(".");
  while (n > 0) {
    /* Setting a limit on length: 32 characters */
    if (binary.length >= 32) {
      //return "ERROR";
      return binary.toString();
    }

    if (n >= frac) {
      binary.write(1);
      n -= frac;
    } else {
      binary.write(0);
    }

    frac /= 2;
  }

  return binary.toString();
}

void main() {
  String bs = printBinary(0.125);
  print(bs);
  //print((0.125).toRadixString(2));

  for (int i = 0; i < 1000; i++) {
    double n = i / 10000.0;
    String binary = printBinary(n);
    String binary2 = printBinary2(n);
    //if (!(binary == "ERROR") || !(binary2 == "ERROR")) {
      print("$n : $binary $binary2");
    //}
  }
}