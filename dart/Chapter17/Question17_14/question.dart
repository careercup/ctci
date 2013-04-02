import "../../utils/assorted_methods.dart";
import "../../utils/trie.dart";
import 'dart:math' as Math;

class Result {
  int invalid = 0xffffffffffffffffffffffff;
  String parsed = "";
  Result(this.invalid, this.parsed);

  Result clone() => new Result(this.invalid, this.parsed);

  static Result min(Result r1, Result r2) {
    if (r1 == null) {
      return r2;
    } else if (r2 == null) {
      return r1;
    }

    return r2.invalid < r1.invalid ? r2 : r1;
  }
}

String sentence;
Trie dictionary;

Result parse(int wordStart, int wordEnd, Map<int, Result> cache) {
  if (wordEnd >= sentence.length) {
    return new Result(wordEnd - wordStart, sentence.substring(wordStart).toUpperCase());
  }

  if (cache.containsKey(wordStart)) {
    return cache[wordStart].clone();
  }

  String currentWord = sentence.substring(wordStart, wordEnd + 1);
  bool validPartial = dictionary.containsExact(currentWord, false);
  bool validExact = validPartial && dictionary.containsExact(currentWord, true);

  /* Break current word */
  Result bestExact = parse(wordEnd + 1, wordEnd + 1, cache);
  if (validExact) {
    bestExact.parsed = "$currentWord ${bestExact.parsed}";
  } else {
    bestExact.invalid += currentWord.length;
    bestExact.parsed = "${currentWord.toUpperCase()} ${bestExact.parsed}";
  }

  /* extend current word */
  Result bestExtend = null;
  if (validPartial) {
    bestExtend = parse(wordStart, wordEnd + 1, cache);
  }

  /* find best */
  Result best = Result.min(bestExact, bestExtend);
  cache[wordStart] = best.clone();
  return best;
}


int parseOptimized(int wordStart, int wordEnd, Map<int, int> cache) {
  if (wordEnd >= sentence.length) {
    return wordEnd - wordStart;
  }

  if (cache.containsKey(wordStart)) {
    return cache[wordStart];
  }

  String currentWord = sentence.substring(wordStart, wordEnd + 1);
  bool validPartial = dictionary.containsExact(currentWord, false);

  /* break current word */
  int bestExact = parseOptimized(wordEnd + 1, wordEnd + 1, cache);
  if (!validPartial || !dictionary.containsExact(currentWord, true)) {
    bestExact += currentWord.length;
  }

  /* extend current word */
  int bestExtend = 0xffffffffffffffffffffffff;
  if (validPartial) {
    bestExtend = parseOptimized(wordStart, wordEnd + 1, cache);
  }

  /* find best */
  int min = Math.min(bestExact, bestExtend);
  cache[wordStart] = min;
  return min;
}

int parseSimple(int wordStart, int wordEnd) {
  if (wordEnd >= sentence.length) {
    return wordEnd - wordStart;
  }

  String word = sentence.substring(wordStart, wordEnd + 1);

  /* break current word */
  int bestExact = parseSimple(wordEnd + 1, wordEnd + 1);
  if (!dictionary.containsExact(word, true)) {
    bestExact += word.length;
  }

  /* extend current word */
  int bestExtend = parseSimple(wordStart, wordEnd + 1);

  /* find best */
  return Math.min(bestExact, bestExtend);
}

String clean(String str) {
  List<String> punctuation = [',', '"', '!', '.', '\'', '?', ','];
  for (String c in punctuation) {
    str = str.replaceAll(c, ' ');
  }

  return str.replaceAll(" ", "").toLowerCase();
}

void main() {
  dictionary = getTrieDictionary();
  sentence = "As one of the top companies in the world, Google will surely attract the attention of computer gurus. This does not, however, mean the company is for everyone.";
  sentence = clean(sentence);
  print(sentence);
  Result vv = parse(0, 0,  new Map<int, Result>());
  print(vv.parsed);
  Map m = new Map<int, int>();
  int v = parseOptimized(0, 0, m);
  print(m);
  print(v);
  print(sentence);
}