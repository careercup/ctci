package Question1_5

import (
	"testing"
)

func TestCompress(t *testing.T) {
	cases := []struct {
		input  string
		expect string
	}{
		{"aabcccccaaa", `a2b1c5a3`},
		{"zxy", `zxy`},
	}
	for _, thisCase := range cases {
		result := compress(thisCase.input)
		if result != thisCase.expect {
			t.Errorf("Compress: input %q, expected %q, but got %q\n",
				thisCase.input, thisCase.expect, result)
		}
	}
}
