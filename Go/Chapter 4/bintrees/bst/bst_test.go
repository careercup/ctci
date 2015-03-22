package bst

import (
    "math/rand"
    "time"
    "fmt"
    "testing"
)

type myInt int
func (me myInt) Less( he Interface ) bool { return me < he.(myInt) }

func randomIntList(N int, max int) []myInt {
    rand.Seed( time.Now().UTC().UnixNano() )
    list := make([]myInt, 1)
    for i:=0; i < N; i++ {
        list = append(list, myInt(rand.Intn(max)) ) // append grows the slice as needed
    }
    return list
}

func TestTree(t *testing.T) {
    items := randomIntList(7, 10)
    fmt.Printf("The list -> tree: %v\n", items)
    tree := New()
    for _, value := range items {
        tree.Insert(value)
        tree.check_ri()
    }
}
