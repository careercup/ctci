import 'dart:math';

/* Flip a positive sign to a negative, or a negative sign to pos */
int negate(int a) {
  int neg = 0;
  int d = a < 0 ? 1 : -1;
  while (a != 0) {
    neg += d;
    a += d;
  }

  return neg;
}

/* Subtract two numbers by negating b and adding them */
int minus(int a, int b) {
  return a + negate(b);
}

/* Return absolute value */
int abs(int a) {
  if (a < 0) {
    return negate(a);
  } else {
    return a;
  }
}

/* Multiply a by b by adding a to itself b times */
int multiply(int a, int b) {
  if (a < b) {
    return multiply(b, a); // algo is faster if b < a
  }

  int sum = 0;
  for (int i = abs(b); i > 0; i--) {
    sum += a;
  }

  if (b < 0) {
    sum = negate(sum);
  }

  return sum;
}

/* Divide a by b by literally counting how many times b can go into
 * a. That is, count how many times you can add b to itself until you reach a. */
int divide(int a, int b) {
  if (b == 0) {
    throw "Error: Divide by zero.";
  }

  int absa = abs(a);
  int absb = abs(b);

  int product = 0;
  int x = 0;

  while(product + absb <= absa) { /* don't go past a */
    product += absb;
    x++;
  }

  if ((a < 0 && b < 0) || (a > 0 && b > 0)) {
    return x;
  } else {
    return negate(x);
  }
}

int randomInt(int n) => (new Random().nextDouble() * n).toInt();

void main() {

  int q = multiply(-5, -10);
  print(q);

  for (int i = 0; i < 100; i++) {
    int a = randomInt(10);
    int b = randomInt(10);
    int ans = minus(a, b);
    if (ans != a - b) {
      print("ERROR");
    }
    print("$a - $b = $ans");
  }

  for (int i = 0; i < 100; i++) {
    int a = randomInt(10);
    int b = randomInt(10);
    int ans = multiply(a, b);
    if (ans != a * b) {
      print("ERROR");
    }
    print("$a * $b = $ans");
  }

  for (int i = 0; i < 100; i++) {
    int a = randomInt(10) + 1;
    int b = randomInt(10) + 1;
    print("$a ~/ $b");
    int ans = divide(a, b);
    if (ans != a ~/ b) {
      print("ERROR");
    }
    print("$a ~/ $b = $ans");
  }
}