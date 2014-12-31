package Question1_2

import (
	"testing"
)

func TestReverse(t *testing.T) {
	cases := []struct {
		input  string
		expect string
	}{
		{"abcd", "dcba"},
		{"abcde", "edcba"},
	}

	for _, thisCase := range cases {
		result := reverse(thisCase.input)
		if result != thisCase.expect {
			t.Errorf("reverse: input %q, expect %q, but got %q\n", thisCase.input, thisCase.expect, result)
		}
	}
}
