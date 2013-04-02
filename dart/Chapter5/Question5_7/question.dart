import 'dart:math';
Random random = new Random();

class BitInteger {
  static int INTEGER_SIZE;
  List<bool> bits;

  /**
   * Creates a number equal to given value. Takes time proportional
   * to INTEGER_SIZE.
   */
  BitInteger(int value) {
    bits = new List<bool>(INTEGER_SIZE);
    for (int j = 0; j < INTEGER_SIZE;  j++) {
      if (((value >> j) & 1) == 1) {
        bits[INTEGER_SIZE - 1 - j] = true;
      } else {
        bits[INTEGER_SIZE - 1 - j] = false;
      }
    }
  }

  /**
   * Returns k-th most-significant bit.
   */
  int fetch(int k) {
    if (bits[k]) {
      return 1;
    } else {
      return 0;
    }
  }

  /**
   * Sets k-th most-significant bit.
   */
  void setAsInt(int k, int bitValue) {
    if (bitValue == 0) {
      bits[k] = false;
    } else {
      bits[k] = true;
    }
  }

  /**
   * Sets k-th most significant bit
   */
  void setAsString(int k, String bitValue) {
    if (bitValue == '0') {
      bits[k] = false;
    } else {
      bits[k] = true;
    }
  }

  /**
   * Sets k-th most-significant bit.
   */
  void setAsBool(int k, bool bitValue) {
    bits[k] = bitValue;
  }

  void swapValues(BitInteger number) {
    for (int i = 0; i < INTEGER_SIZE; i++) {
      int temp = number.fetch(i);
      number.setAsInt(i, this.fetch(i));
      this.setAsInt(i, temp);
    }
  }


  int toInt() {
    int number = 0;
    for (int j = INTEGER_SIZE - 1; j >= 0; j--) {
      number = number | fetch(j);
      if (j > 0) {
        number = number << 1;
      }
    }

    return number;
  }
}

List<BitInteger> initialize(int n, int missing) {
  BitInteger.INTEGER_SIZE = n.toRadixString(2).length;
  List<BitInteger> array = new List<BitInteger>();

  for (int i = 1; i <= n; i++) {
    array.add(new BitInteger(i == missing ? 0 : i));
  }

  // Shuffle the array once.
  for (int i = 0; i < n; i++) {
    int rand = i + (random.nextDouble() * (n - i)).toInt();
    array[i].swapValues(array[rand]);
  }

  return array;
}

int findMissing(List input, {int column: null}) {
  //return findMissing(array, BitInteger.INTEGER_SIZE - 1);
  if (column == null) {
    column = BitInteger.INTEGER_SIZE - 1;
  }

  if (column < 0) { // Base case and error condition
    return 0;
  }

  List<BitInteger> oneBits = new List<BitInteger>();
  List<BitInteger> zeroBits = new List<BitInteger>();

  for (BitInteger t in input) {
    if (t.fetch(column) == 0) {
      zeroBits.add(t);
    } else {
      oneBits.add(t);
    }
  }

  if (zeroBits.length <= oneBits.length) {
    int v = findMissing(zeroBits, column: column - 1);
    print("0");
    return (v << 1) | 0;
  } else {
    int v = findMissing(oneBits, column: column - 1);
    print("1");
    return (v << 1) | 1;
  }
}


void main() {
  int n = random.nextInt(300000) + 1;
  int missing = random.nextInt(n + 1);
  List array = initialize(n, missing);
  print("The array contains all numbers but one from 0 to $n, except for $missing");

  int result = findMissing(array);
  if (result != missing) {
    print("Error in the algorithm!\nThe missing number is $missing, but the algorithm reported $result");
  } else {
    print("The missing number is $result");
  }
}