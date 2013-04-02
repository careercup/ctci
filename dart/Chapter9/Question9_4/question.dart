List<List<int>> getSubsets(List<int> set, int index) {
  List<List<int>> allsubsets;
  if (set.length == index) { // Base case -add empty set
    allsubsets = new List<List<int>>();
    allsubsets.add(new List<int>());
  } else {
    allsubsets = getSubsets(set, index + 1);
    int item = set[index];
    List<List<int>> moresubsets = new List<List<int>>();
    for (List<int> subset in allsubsets) {
      List<int> newsubset = new List<int>();
      newsubset.addAll(subset);
      newsubset.add(item);
      moresubsets.add(newsubset);
    }
    allsubsets.addAll(moresubsets);
  }

  return allsubsets;
}

List<int> convertIntToSet(int x, List<int> set) {
  List<int> subset = new List<int>();
  int index = 0;
  for (int k = x; k > 0; k >>= 1) {
    if ((k & 1) == 1) {
      subset.add(set[index]);
    }
    index++;
  }
  return subset;
}

List<List<int>> getSubsets2(List<int> set) {
  List<List<int>> allsubsets = new List<List<int>>();
  int max = 1 << set.length; /* Compute 2^n */
  for(int k = 0; k < max; k++) {
    List<int> subset = convertIntToSet(k, set);
    allsubsets.add(subset);
  }
  return allsubsets;
}

void main() {
  List<int> list = new List<int>();
  for (int i = 0; i < 3; i++) {
    list.add(i);
  }

  List<List<int>> subsets = getSubsets(list, 0);
  print(subsets.toString());

  List<List<int>> subsets2 = getSubsets2(list);
  print(subsets2.toString());


}