import '../../utils/assorted_methods.dart';
import 'dart:math';

List<String> digits = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"];
List<String> teens = ["Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"];
List<String> tens = ["Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"];
List<String> bigs = ["", "Thousand", "Million"];

String numToString(int number) {
  if (number == 0) {
    return "Zero";
  }

  if (number < 0) {
    return "Negative ${numToString(-1 * number)}";
  }

  int count = 0;
  String str = "";

  while (number > 0) {
    if (number % 1000 != 0) {
      str = "${numToString100(number % 1000)}${bigs[count]} ${str}";
    }

    number ~/= 1000;
    count++;
  }

  return str;
}

String numToString100(int number) {
  String str = "";

  /* Convert hundreds place */
  if (number >= 100) {
    str = "${str}${digits[number ~/ 100 - 1]} Hundred ";
    number %= 100;
  }

  /* Convert tens place */
  if (number >= 11 && number <= 19) {
    return "${str}${teens[number - 11]} ";
  } else if (number == 10 || number >= 20) {
    str = "${str}${tens[number ~/ 10 - 1]} ";
    number %= 10;
  }

  /* Convert ones place */
  if (number >= 1 && number <= 9) {
    str = "${str}${digits[number - 1]} ";
  }

  return str;
}

void main() {
  /* numbers between 100000 and 1000000 */
  for (int i = 0; i < 8; i++) {
    int value = pow(10, i).toInt();
    String s = numToString(-1 * value);
    print("${value}: $s");
  }

  /* numbers between 0 and 100 */
  for (int i = 0; i < 10; i++) {
    int value = randomIntInRange(0, 100);
    String s = numToString(value);
    print("${value}: $s");
  }

  /* numbers between 100 and 1000 */
  for (int i = 0; i < 10; i++) {
    int value = randomIntInRange(100, 1000);
    String s = numToString(value);
    print("${value}: $s");
  }

  /* numbers between 1000 and 100000 */
  for (int i = 0; i < 10; i++) {
    int value = randomIntInRange(1000, 100000);
    String s = numToString(value);
    print("${value}: $s");
  }

  /* numbers between 100000 and 1000000 */
  for (int i = 0; i < 10; i++) {
    int value = randomIntInRange(100000, 100000000);
    String s = numToString(value);
    print("${value}: $s");
  }

  /* numbers between 100000 and 1000000 */
  for (int i = 0; i < 10; i++) {
    int value = randomIntInRange(100000000, 1000000000);
    String s = numToString(value);
    print("${value}: $s");
  }
}