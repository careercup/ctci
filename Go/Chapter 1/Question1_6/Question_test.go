package Question1_6

import (
	"testing"
)

func TestRotate90(t *testing.T) {
	cases := []struct {
		input  matrixNN
		expect matrixNN
	}{
		{ matrixNN{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}} ,
        matrixNN{{7, 4, 1}, {8, 5, 2}, {9, 6, 3}} },
        { matrixNN{ {1, 2, 3, 4}, { 5, 6, 7, 8}, { 9, 10, 11, 12 }, {13, 14, 15, 16} },
        matrixNN{ {13, 9, 5, 1}, {14, 10, 6, 2}, {15, 11, 7, 3}, {16, 12, 8, 4} } },
	}

	for _, thisCase := range cases {
        input := thisCase.input
        thisCase.input.rotate90()
        result := thisCase.input
		if (!result.compare( thisCase.expect )) {
			t.Errorf("\n__________\nRotate90: \ninput %v \nexpected %v\n but got %v \n______________", input, thisCase.expect, result)
		}
	}
}
