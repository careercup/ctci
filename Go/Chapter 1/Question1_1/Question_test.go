package Question1_1

import (
	"testing"
)

func TestIsUniqueChars(t *testing.T) {
	cases := []struct {
		input  string
		expect bool
	}{
		{"abcd", true},
		{"", true},
		{`_\/,"'.;`, true},
		{"abca", false},
		{"aaaa", false},
	}

	for _, thisCase := range cases {
		result := isUniqueChars(thisCase.input)
		if result != thisCase.expect {
			t.Errorf("isUniqueChars: input %q, expect %v, but got %v\n", thisCase.input, thisCase.expect, result)
		}
		result2 := isUniqueChars2(thisCase.input)
		if result2 != thisCase.expect {
			t.Errorf("isUniqueChars2: input %q, expect %v, but got %v\n", thisCase.input, thisCase.expect, result2)
		}
	}
}
