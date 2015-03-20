package main
/*
Imagine a (literal) stack of plates. If the stack gets too high, it might topple.
Therefore, in real life, we would likely start a new stack when the previous stack
exceeds some threshold. Implement a data structure SetOfStacks that mimics
this. SetOfStacks should be composed of several stacks and should create a
new stack once the previous one exceeds capacity. SetOfStacks.push() and
SetOfStacks.pop() should behave identically to a single stack (that is, popO
should return the same values as it would if there were just a single stack).

FOLLOW UP

Implement a function popAt(int index) which performs a pop operation on
a specific sub-stack.
 */
import (
    "../stack"
    "fmt"
    "errors"
)
const threshold = 10

type SetOfStacks struct {
    set []*stack.Stack
    size int
}
func (s *SetOfStacks) getLastStack() *stack.Stack{
    if (len(s.set) == 0) {
        return nil
    }
    return s.set[(len(s.set) - 1)]
}
func (s *SetOfStacks) Push(val int) {
    lastStack := s.getLastStack()
    if(lastStack != nil && lastStack.Len() < threshold) {
        lastStack.Push(val)
    } else {
        /* must create a new stack */
        newStack := new(stack.Stack)
        s.set = append(s.set, newStack)
        newStack.Push(val)
    }
    s.size++
}

func (s *SetOfStacks) Pop() (val int, err error) {
    lastStack := s.getLastStack()
    if(lastStack == nil) {
        return 0, errors.New("SetOfStacks is Empty")
    }
    val, err = lastStack.Pop()
    if (err == nil) {
        s.size--
        return val, nil
    }
    // lastStack is empty
    s.set = s.set[:(len(s.set) - 1)] // delete the lastStack
    // pop the new last stack
    return s.getLastStack().Pop()
}
func (s *SetOfStacks) PopAt(stackNum int) (val int, err error) {
    if ( stackNum > (len(s.set) - 1) ) {
        return 0, errors.New(fmt.Sprintf("error: stack(%v) is not available | currentSize: %v", stackNum, s.size))
    }
    val, err = s.set[stackNum].Pop()
    if (err == nil) {
        s.size--
        return val, nil
    }
    // stackNum is empty, so delete it
    s.set = append(s.set[:stackNum], s.set[stackNum+1:]...) // ... = unpack
    return val, errors.New(fmt.Sprintf("error: stack(%v) is empty", stackNum))
}
func main() {
    setStack := new(SetOfStacks)
    for i := 0; i < 4*threshold; i++ { // 4 stacks
        setStack.Push(i)
    }
    for i := 0; i < 4*threshold; i++ { // pop the 4 stacks
        val, err := setStack.Pop()
        if(err == nil) {
            fmt.Printf(" [ %v ] \n", val)
        } else {
            fmt.Println(err)
        }
    }
    for i := 0; i < 4*threshold; i++ { // 4 stacks again
        setStack.Push(i)
    }
    for i := 0; i < threshold; i++ {
        printStackAtAndPop(setStack, 3)
        printStackAtAndPop(setStack, 2)
        printStackAtAndPop(setStack, 1)
        printStackAtAndPop(setStack, 0)
    }
}
func printStackAtAndPop(s *SetOfStacks, stackNum int) {
    val, err := s.PopAt(stackNum)
    if( err == nil ) {
        fmt.Printf(" stack(%v) Pop : [ %v ] \n", stackNum, val)
    } else {
        fmt.Println(err)
    }
}
