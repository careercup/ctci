
class Term {
  static const True = 0;
  static const False = 1;
  static const And = 2;
  static const Or = 3;
  static const Xor = 4;
  static const LeftParen = 5;
  static const RightParen = 6;
  int value;
  Term(this.value);
}

String reduce(String expression, int start, int end) {

  if (start == end) {
    if (expression[start] == '1') {
      return "1";
    } else if (expression[start] == '0') {
      return "0";
    }
  }

  int count = 0;
  int i = 0;
  List<String> reduced = new List<String>(3);
  int index = 0;
  int left = start;
  int right = start;
  for (i = start; i <= end; i++) {
    if (expression[i] == '(') {
      if (count == 0) {
        left = i + 1;
      }
      count++;
    } else if (expression[i] == ')') {
      count--;
      if (count == 0) {
        right = i - 1;
      }
    }

    if (count == 0) {
      reduced[index] = reduce(expression, left, right);
      if (index == 0) {
        reduced[index + 1] = expression[i + 1];
        i += 1;
        left = i + 1;
        right = i + 1;
      }
      index += 2;
    }
  }

  if (reduced[1] == "&") {
    if (reduced[0] == "1" && reduced[2] == "1") {
      return "1";
    }

    return "0";
  } else if (reduced[1] == "|") {
    if (reduced[0] == "1" || reduced[2] == "1") {
      return "1";
    }

    return "0";
  } else if (reduced[1] == "^") {
    if (reduced[0] == "1" && reduced[2] == "0") {
      return "1";
    } else if (reduced[0] == "0" && reduced[2] == "1") {
      return "1";
    }

    return "0";
  }

  return "0";
}

bool evaluate(String expression, int start, int end) {
  String result = reduce(expression, start, end);
  if (result == "0") {
    return false;
  } else {
    return true;
  }
}

bool isOperator(String c) {
  switch(c) {
    case '&':
    case '|':
    case '^':
      return true;
    default:
      return false;
  }
}

String insertParensAround(String expression, int ind) {
  int left = 0;
  int right = 0;
  int index = 0;
  int count = 0;
  for (int i = 0; i < expression.length; i++) {
    if (isOperator(expression[i])) {
      if (count == ind) {
        index = i;
      }
      count++;
    }
  }

  count = 0;

  for (int i = index - 1; i >= 0; i--) {
    if (expression[i] == ')') {
      count++;
    } else if (expression[i] == '(') {
      count--;
    }

    if (count == 0) {
      left = i;
      break;
    }
  }

  count = 0;
  for (int i = index + 1; i <= expression.length; i++) {
    if (expression[i] == '(') {
      count++;
    } else if (expression[i] == ')') {
      count--;
    }

    if (count == 0) {
      right = i;
      break;
    }
  }

  if (left == 0 && right == expression.length - 1) {
    return expression;
  }

  StringBuffer sb = new StringBuffer();
  sb.write(expression.substring(0, left));
  sb.write('(');
  sb.write(expression.substring(left, right + 1));
  sb.write(')');
  sb.write(expression.substring(right + 1));
  String newexpression = sb.toString();
  return newexpression;
}

int bruteForce(String expression, Map<String, bool> completed, bool result, List<bool> flags) {
  int count = 0;
  bool isDone = true;
  if (completed.containsKey(expression)) {
    return 0;
  }

  for (int i = 0; i < flags.length; i++) {
    if (!flags[i]) {
      flags[i] = true;
      String newexpression = insertParensAround(expression, i);
      isDone = false;
      count += bruteForce(newexpression, completed, result, flags);
      flags[i] = false;
    }
  }

  if (isDone) {
    if (evaluate(expression, 0, expression.length - 1) == result) {
      print("$expression = $result");
      return 1;
    } else {
      print("$expression = $result");
      return 0;
    }
  }


  completed[expression] = true;
  return count;
}

int countR(String exp, bool result, int start, int end) {

  if (start == end) {
    if (exp[start] == '1' && result) {
      return 1;
    } else if (exp[start] == '0' && !result) {
      return 1;
    }

    return 0;
  }

  int c = 0;
  if (result) {
    for (int i = start + 1; i <= end; i += 2) {
      String op = exp[i];
      if (op == '&') {
        c += countR(exp, true, start, i - 1) * countR(exp, true, i + 1, end);
      } else if (op == '|') {
        c += countR(exp, true, start, i - 1) * countR(exp, false, i + 1, end);
        c += countR(exp, false, start, i - 1) * countR(exp, true, i + 1, end);
        c += countR(exp, true, start, i - 1) * countR(exp, true, i + 1, end);
      } else if (op == '^') {
        c += countR(exp, true, start, i - 1) * countR(exp, false, i + 1, end);
        c += countR(exp, false, start, i - 1) * countR(exp, true, i + 1, end);
      }
    }
  } else {
    for (int i = start + 1; i <= end; i += 2) {
      String op = exp[i];
      if (op == '&') {
        c += countR(exp, false, start, i - 1) * countR(exp, true, i + 1, end);
        c += countR(exp, true, start, i - 1) * countR(exp, false, i + 1, end);
        c += countR(exp, false, start, i - 1) * countR(exp, false, i + 1, end);
      } else if (op == '|') {
        c += countR(exp, false, start, i - 1) * countR(exp, false, i + 1, end);
      } else if (op == '^') {
        c += countR(exp, true, start, i - 1) * countR(exp, true, i + 1, end);
        c += countR(exp, false, start, i - 1) * countR(exp, false, i + 1, end);
      }
    }
  }

  return c;
}

int countDP(String exp, bool result, int start, int end, Map cache) {
  String key = "${result}${start}${end}";
  if (cache.containsKey(key)) {
    return cache[key];
  }

  if (start == end) {
    if (exp[start] == '1' && result == true) {
      return 1;
    } else if (exp[start] == '0' && result == false) {
      return 1;
    }

    return 0;
  }

  int count = 0;
  if (result) {
    for (int i = start + 1; i <= end; i += 2) {
      String op = exp[i];
      if (op == '&') {
        count += countDP(exp, true, start, i - 1, cache) * countDP(exp, true, i + 1, end, cache);
      } else if (op == '|') {
        count += countDP(exp, true, start, i - 1, cache) * countDP(exp, false, i + 1, end, cache);
        count += countDP(exp, false, start, i - 1, cache) * countDP(exp, true, i + 1, end, cache);
        count += countDP(exp, true, start, i - 1, cache) * countDP(exp, true, i + 1, end, cache);
      } else if (op == '^') {
        count += countDP(exp, true, start, i - 1, cache) * countDP(exp, false, i + 1, end, cache);
        count += countDP(exp, false, start, i - 1, cache) * countDP(exp, true, i + 1, end, cache);
      }
    }
  } else {
    for (int i = start + 1; i <= end; i += 2) {
      String op = exp[i];
      if (op == '&') {
        count += countDP(exp, false, start, i - 1, cache) * countDP(exp, true, i + 1, end, cache);
        count += countDP(exp, true, start, i - 1, cache) * countDP(exp, false, i + 1, end, cache);
        count += countDP(exp, false, start, i - 1, cache) * countDP(exp, false, i + 1, end, cache);
      } else if (op == '|') {
        count += countDP(exp, false, start, i - 1, cache) * countDP(exp, false, i + 1, end, cache);
      } else if (op == '^') {
        count += countDP(exp, true, start, i - 1, cache) * countDP(exp, true, i + 1, end, cache);
        count += countDP(exp, false, start, i - 1, cache) * countDP(exp, false, i + 1, end, cache);
      }
    }
  }

  cache[key] = count;
  return count;
}

int total(int n) {
  // Function to return (2n)!/((n+1)! * n!)

  // To keep the numbers small, we divided by i when possible to do evenly. If
  // not, we store up the remainder and divide when possible.
  int num = 1;
  int rem = 1;
  for (int i = 2; i <= n; i++) {
    num *= (n + i);
    rem *= i;
    if (num % rem == 0) {
      num ~/= rem;
      rem = 1;
    }
  }

  return num;
}

int countDPEff(String exp, bool result, int start, int end, Map<String, int> cache) {
  String key = "${start}${end}";
  int count = 0;
  if (!cache.containsKey(key)) {
    if (start == end) {
      if (exp[start] == '1') {
        count = 1;
      } else {
        count = 0;
      }
    }

    for (int i = start + 1; i <= end; i += 2) {
      String op = exp[i];
      if (op == '&') {
        count += countDPEff(exp, true, start, i - 1, cache) * countDPEff(exp, true, i + 1, end, cache);
      } else if (op == '|') {
        int left_ops = (i - 1 - start) ~/ 2; // parens on left
        int right_ops = (end - i - 1) ~/ 2; // parens on right
        int total_ways = total(left_ops) * total(right_ops);
        int total_false = countDPEff(exp, false, start, i - 1, cache) * countDPEff(exp, false, i + 1, end, cache);
        count += total_ways - total_false;
      } else if (op == '^') {
        count += countDPEff(exp, true, start, i - 1, cache) * countDPEff(exp, false, i + 1, end, cache);
        count += countDPEff(exp, false, start, i - 1, cache) * countDPEff(exp, true, i + 1, end, cache);
      }
    }

    cache[key] = count;
  } else {
    count = cache[key];
  }

  if (result) {
    return count;
  } else {
    int num_ops = (end - start) ~/ 2;
    return total(num_ops) - count;
  }
}


void main() {
  String terms = "0^0|1&1^1|0|1";
  bool result = true;

  bruteForce(terms, new Map<String, bool>(), result, new List<bool>.fixedLength((terms.length - 1) ~/ 2, fill: false));
  print(countR(terms, result, 0, terms.length - 1));
  print(countDP(terms, result, 0, terms.length - 1, new Map<String, int>()));
  print(countDPEff(terms, result, 0, terms.length - 1, new Map<String, int>()));
}