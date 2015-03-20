package Question1_7

import (
	"testing"
)

func TestSetZeroes(t *testing.T) {
	cases := []struct {
		input  matrixMN
		expect matrixMN
	}{
		{ matrixMN{{1, 2, 3}, {4, 0, 6}, {7, 8, 9}} ,
        matrixMN{{1, 0, 3}, {0, 0, 0}, {7, 0, 9}} },
        { matrixMN{ {1, 2, 3, 0}, { 5, 6, 7, 8}, { 9, 10, 11, 12 }  },
        matrixMN{ {0, 0, 0, 0}, {5, 6, 7, 0}, {9, 10, 11, 0} } },
	}

	for _, thisCase := range cases {
        input := thisCase.input
        thisCase.input.setZeroes()
        result := thisCase.input
		if (!result.compare( thisCase.expect )) {
			t.Errorf("\n__________\nRotate90: \ninput %v \nexpected %v\n but got %v \n______________", input, thisCase.expect, result)
		}
	}
}
