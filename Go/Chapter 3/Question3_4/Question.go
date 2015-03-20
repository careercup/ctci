package main
/*

In the classic problem of the Towers of Hanoi, you have 3 towers and N disks of
different sizes which can slide onto any tower. The puzzle starts with disks sorted
in ascending order of size from top to bottom (i.e., each disk sits on top of an
even larger one). You have the following constraints:
    (1) Only one disk can be moved at a time.
    (2) A disk is slid off the top of one tower onto the next tower.
    (3) A disk can only be placed on top of a larger disk.
Write a program to move the disks from the first tower to the last using stacks.

*/
import (
    "../stack"
    "fmt"
)
type Tower struct {
    discs *stack.Stack
    index int
}

func (t *Tower) MoveDisks(n int, helper *Tower, target *Tower) {
    if (n > 0) {
        // move D1 to D(n-1) from source to helper
        t.MoveDisks(n-1, target, helper)
        // move D(n) to target
        t.MoveOne(n, helper, target)
        // move D1 to D(n-1) from helper to target
        helper.MoveDisks(n-1, t, target)
    }
}
func (t *Tower) MoveOne(n int, helper *Tower, target *Tower) {
    fmt.Printf("Move disc(%v) from %v to %v through %v\n", n, t, target, helper)
    val, _ := t.discs.Pop()
    target.Add(val)
}
func (t *Tower) String() string {
    return fmt.Sprintf("Tower(%v)", t.index)
}
func (t *Tower) Add(i int) {
    t.discs.Push(i)
}
func newTower(i int) *Tower {
    return &Tower{new(stack.Stack), i}
}
func main() {
	N := 3 // 3 discs
	towers := make([]*Tower, 3)
	for i := 0; i < 3; i++ {
		towers[i] = newTower(i)
	}
    /* place all disks to first tower */
	for i := N - 1; i >= 0; i-- {
		towers[0].Add(i)
	}
    /* Move from tower(0) to tower(2) with the help of tower(1) */
	towers[0].MoveDisks(N, towers[1], towers[2]);
}
