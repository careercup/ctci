package list

import (
    "testing"
)

func TestLength(t *testing.T) {
    for i := 1; i < 10; i++ {
        l := RandomLinkedList(i, 1, 10)
        result := l.Len()
        if (result != i) {
            t.Errorf("Length: Got-%v Expected-%v\n", result, i)
        }
    }
}
