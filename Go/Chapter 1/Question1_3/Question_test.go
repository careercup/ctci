package Question1_3

import (
	"testing"
)

func TestPermutation(t *testing.T) {
	cases := []struct {
		input1 string
		input2 string
		expect bool
	}{
		{"apple", "papel", true},
		{"carrot", "tarroc", true},
		{"hello", "llloh", false},
	}
	for _, thisCase := range cases {
		result := permutation(thisCase.input1, thisCase.input2)
		if result != thisCase.expect {
			t.Errorf("reverse: input (%q, %q), expected %v, but got %v\n",
				thisCase.input1, thisCase.input2, thisCase.expect, result)
		}
	}
}
