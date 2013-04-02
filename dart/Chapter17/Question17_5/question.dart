import 'dart:math';

class Result {
  int hits;
  int pseudoHits;
  Result([this.hits = 0, this.pseudoHits = 0]);
  String toString() => "($hits, $pseudoHits)";
}

int code (String c) {
  switch (c) {
    case 'B': return 0;
    case 'G': return 1;
    case 'R': return 2;
    case 'Y': return 3;
    default:  return -1;
  }
}

final int MAX_COLORS = 4;

Result estimate(String guess, String solution) {
  if (guess.length != solution.length) {
    return null;
  }

  Result res = new Result();
  List<int> frequences = new List<int>.fixedLength(MAX_COLORS, fill: 0);

  /* Compute hits and built frequency table */
  for (int i = 0; i < guess.length; i++) {
    if (guess[i] == solution[i]) {
      res.hits++;
    } else {
      /*
       * Only increment the frequency table (which will be used for
       * pseudo-hits) if it's not a hit. If it's a hit, the slot has
       * already been "used."
       */
      int c = code(solution[i]);
      if (c >= 0) {
        frequences[c]++;
      }
    }
  }

  /* Compute pseudo-hits */
  for (int i = 0; i < guess.length; i++) {
    int c = code(guess[i]);
    if (c >= 0 && frequences[c] > 0 && guess[i] != solution[i]) {
      res.pseudoHits++;
      frequences[c]--;
    }
  }

  return res;
}

/**** Test Code ***/
String letterFromCode(int k) {
  switch(k) {
    case 0: return 'B';
    case 1: return 'G';
    case 2: return 'R';
    case 3: return 'Y';
    default: return '0';
  }
}

Result estimateBad(String g, String s) {
  List<String> guess = g.split('');
  List<String> solution = s.split('');
  int hits = 0;
  for (int i = 0; i < guess.length; i++) {
    if (guess[i] == solution[i]) {
      hits++;
      solution[i] = '0';
      guess[i] = '0';
    }
  }

  int pseudoHits = 0;

  for (int i = 0; i < guess.length; i++) {
    if (guess[i] != '0') {
      for (int j = 0; j < solution.length; j++) {
        if (solution[j] != '0') {
          if (solution[j] == guess[i]) {
            pseudoHits++;
            solution[j] = '0';
            break;
          }
        }
      }
    }
  }

  return new Result(hits, pseudoHits);
}

String randomString() {
  int length = 4;
  List<String> str = new List<String>.fixedLength(length);
  Random generator = new Random();
  for (int i = 0; i < length; i++) {
    int v = generator.nextInt(length);
    String c = letterFromCode(v);
    str[i] = c;
  }

  return str.join();
}

bool test(String guess, String solution) {
  Result res1 = estimate(guess, solution);
  Result res2 = estimateBad(guess, solution);
  if (res1.hits == res2.hits && res1.pseudoHits == res2.pseudoHits) {
    return true;
  } else {
    print("FAIL: ($guess, $solution): ${res1.toString()} | ${res2.toString()}");
    return false;
  }
}

bool testRandom() {
  String guess = randomString();
  String solution = randomString();
  return test(guess, solution);
}

bool testCount(int count) {
  for (int i = 0; i < count; i++) {
    if (!testRandom()) {
      return true;
    }
  }

  return false;
}

void main() {
  print(testCount(1000));
}


