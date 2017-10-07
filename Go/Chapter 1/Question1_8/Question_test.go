package Question1_8

import (
	"testing"
)

func TestIsRotation(t *testing.T) {
	cases := []struct {
		input  []string
		expect bool
	}{
		{ []string{"apple", "pleap"} , true },
        { []string{"waterbottle", "erbottlewat"}, true },
        { []string{"camera", "macera"}, false },
        { []string{"santhosh", "@santhosh"}, false},
	}

	for _, thisCase := range cases {
        input := thisCase.input
        result := isRotation(input[0], input[1])
		if (result != thisCase.expect) {
			t.Errorf("IsRotation: input %q expected %v but got %v", input, thisCase.expect, result)
		}
	}
}
