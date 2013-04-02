
class HtWt implements Comparable {
  int Ht;
  int Wt;
  HtWt(this.Ht, this.Wt);
  int compareTo(HtWt other) {
    if (Ht != other.Ht) {
      return Ht.compareTo(other.Ht);
    } else {
      return Wt.compareTo(other.Wt);
    }
  }

  String toString() => "($Ht, $Wt)";

  /*
   * Returns true if "this" should be lined up before "other".
   * Note that it's possible that this.isBefore(other) and
   * other.isBefore(this) are both false. This is different from
   * the compareTo method, where if a < b then b > a.
   */
  bool isBefore(HtWt other) {
    if (Ht < other.Ht && Wt < other.Wt) {
      return true;
    } else {
      return false;
    }
  }
}

// Returns longer sequence
List<HtWt> seqWithMaxLength(List<HtWt> seq1, List<HtWt> seq2) {
  if (seq1 == null) {
    return seq2;
  } else if (seq2 == null) {
    return seq1;
  }

  return seq1.length > seq2.length ? seq1 : seq2;
}

void longestIncreasingSubsequence(List<HtWt> array, List<List<HtWt>> solutions, int current_index) {

  if (current_index >= array.length || current_index < 0) {
    return;
  }

  HtWt current_element = array[current_index];

  // Find longest sequence that we can append current_element to
  List<HtWt> best_sequence = null;
  for (int i = 0; i < current_index; i++) {
    if (array[i].isBefore(current_element)) { // If current_element is bigger than list tail
      best_sequence = seqWithMaxLength(best_sequence, solutions[i]); // Set best_sequence to our new max
    }
  }

  // Append current_element
  List<HtWt> new_solution = new List<HtWt>();
  if (best_sequence != null) {
    new_solution.addAll(best_sequence);
  }
  new_solution.add(current_element);

  // Add to list and recurse
  solutions[current_index] = new_solution;
  longestIncreasingSubsequence(array, solutions, current_index + 1);
}

List<HtWt> longestIncreasingSubsequenceWithArray(List<HtWt> array) {
  List<List<HtWt>> solutions = new List<List<HtWt>>(array.length);
  longestIncreasingSubsequence(array, solutions, 0);

  List<HtWt> best_sequence = null;
  for (int i = 0; i < array.length; i++) {
    best_sequence = seqWithMaxLength(best_sequence, solutions[i]);
  }

  return best_sequence;
}

List<HtWt> initialize() {
  List<HtWt> items = new List<HtWt>();

  HtWt item = new HtWt(65, 60);
  items.add(item);

  item = new HtWt(70, 150);
  items.add(item);

  item = new HtWt(56, 90);
  items.add(item);

  item = new HtWt(75, 190);
  items.add(item);

  item = new HtWt(60, 95);
  items.add(item);

  item = new HtWt(68, 110);
  items.add(item);

  item = new HtWt(35, 65);
  items.add(item);

  item = new HtWt(40, 60);
  items.add(item);

  item = new HtWt(45, 63);
  items.add(item);

  return items;
}

void printList(List<HtWt> list) {
  for (HtWt item in list) {
    print("${item} ");
  }
}

List<HtWt> getIncreasingSequence(List<HtWt> items) {
  items.sort();
  return longestIncreasingSubsequenceWithArray(items);
}

void main() {
  List<HtWt> items = initialize();
  List<HtWt> solution = getIncreasingSequence(items);
  printList(solution);
}