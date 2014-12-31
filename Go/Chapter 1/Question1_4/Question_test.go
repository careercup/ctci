package Question1_4

import (
	"testing"
)

func countSpaces(str string) int {
  charsArr := []rune(str)
  countSpaces := 0
  for i := 0; i < len(str); i++ {
    if charsArr[i] == rune(' ') {
      countSpaces++
    }
  }
  return countSpaces
}

func TestReplaceSpace(t *testing.T) {
	cases := []struct {
		input string
		expect string
	}{
		{"abc d e f ", `abc%20d%20e%20f%20`},
		{"abc d e f", `abc%20d%20e%20f`},
		{"  ", `%20%20`},
	}
	for _, thisCase := range cases {
    str := thisCase.input;
    // make sufficient memoryspace for spaces in string
    charsArr := make([]rune, (len(str) + countSpaces(str)*2) )
    for i, v := range []rune(str) {
      charsArr[i] = v
    }
    ReplaceSpace(charsArr, len(str))
		result := string(charsArr)
		if result != thisCase.expect {
			t.Errorf("ReplaceSpace: input %q, expected %q, but got %q\n",
				thisCase.input, thisCase.expect, result)
		}
	}
}
