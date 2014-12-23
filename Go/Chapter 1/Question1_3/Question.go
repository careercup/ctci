package Question1_3
import "sort"

type sortRunes []rune

// have to define the three methods for native sort to work
func (s sortRunes) Less(i, j int) bool {
  return s[i] < s[j]
}

func (s sortRunes) Swap(i, j int) {
  s[i], s[j] = s[j], s[i]
}

func (s sortRunes) Len() int {
  return len(s)
}

func SortString(s string) string {
  r := []rune(s)
  sort.Sort(sortRunes(r))
  return string(r)
}

/* Given two strings, decide if one is a permutation of the other */
func permutation(str1, str2 string) bool {
  // if they are anagrams, they will have the same characters
  // hence comparing if their sorted version is equal gives the result
  return SortString(str1) == SortString(str2)
}
