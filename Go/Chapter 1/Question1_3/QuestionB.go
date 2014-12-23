package Question1_3

/* Given two strings, decide if one is a permutation of the other */
func permutation (str1, str2 string) bool {
  if len(str1) != len(str2) {
    return false
  }
  count1 := make([]int, 256) //declare a map of rune to int
  // For each character in input1 string, increment count
  for _ , v := range str1 {
    count1[rune(v)]++
  }
  // For each character in input2 string, decrement count in the count1 map
  // the count becomes less than 0, if there is more count in second string or
  // if that character was not present in string1
  for _ , v := range str2 {
    c := rune(v)
    count1[c]--
    if count1[c] < 0 {
      return false
    }
  }
  return true
}
