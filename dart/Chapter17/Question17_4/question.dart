
/* Flips a 1 to a 0 and a 0 to a 1 */
int flip(int bit) {
  return 1 ^ bit;
}

/* Returns 1 if a is positive, and 0 if a is negative */
int sign(int a) {
  //return a.isNegative ? 0 : 1;
  return flip((a >> 31) & 0x1); // We cant use any comparison operator
}

int getMaxNaive(int a, int b) {
  int k = sign(a - b);
  int q = flip(k);
  return a * k + b * q;
}

int getMax(int a, int b) {
  int c = a - b;

  int sa = sign(a); // if a >= 0, then 1 else 0
  int sb = sign(b); // if b >= 1, then 1 else 0
  int sc = sign(c); // depends on whether or not a - b overflows

  /*
   * We want to define a value k which is 1 if a > b and 0 if a < b.
   * (if a = b, it doesn't matter what value k is)
   */
  int use_sign_of_a = sa ^ sb; // If a and b have different signs, then k = sign(a)
  int use_sign_of_c = flip(sa ^ sb); // If a and b have the same sign, then k = sign(a - b)

  /*
   * We can't use a comparison operator, but we can multiply values by 1 or 0
   */
  int k = use_sign_of_a * sa + use_sign_of_c * sc;
  int q = flip(k);

  return a * k + b * q;
}

void main() {
  int a = 26;
  int b = -15;

  print("max_naive($a, $b) = ${getMaxNaive(a, b)}");
  print("max($a, $b) = ${getMax(a, b)}");

  a = -15;
  b = 2147483647;

  print("max_naive($a, $b) = ${getMaxNaive(a, b)}");
  print("max($a, $b) = ${getMax(a, b)}");
}


