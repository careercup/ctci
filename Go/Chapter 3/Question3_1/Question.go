package main

// How to implement three stacks using a single array
import (
    "errors"
    "fmt"
)

var errorEmptyStack = errors.New("error: stack is empty")
var errorOverflowStack = errors.New("error: stack overflow")

const stackSize int = 10 // size of each stack

var buffer = make( []int, stackSize*3 ) // three stacks using a single array

var stackPointer = []int{ -1, -1, -1 } // pointers to all 3 stacks

/* returns index of the top of the stack "stackNum", in absolute terms */
func absTopOfStack( stackNum int ) int {
	return ((stackNum * stackSize) + stackPointer[stackNum])
}
func isEmpty( stackNum int ) bool {
	return stackPointer[stackNum] == -1
}
func push( stackNum, val int ) error {
    // check if stack is already full
    if( (stackPointer[stackNum]+1) >= stackSize ) {
        return errorOverflowStack
    }
    stackPointer[stackNum]++
    buffer[ absTopOfStack(stackNum) ] = val
    return nil
}

func pop( stackNum int ) (int, error) {
    if( isEmpty(stackNum) ) {
        return -1, errorEmptyStack
    }
    val := buffer[ absTopOfStack(stackNum) ]
    buffer[ absTopOfStack(stackNum) ] = 0 // reset the value
    stackPointer[stackNum]--
    return val, nil
}
func peek(stackNum int) (int, error) {
	if (isEmpty(stackNum)) {
        return -1, errorEmptyStack
	}
	return buffer[ absTopOfStack(stackNum) ], nil
}

func main() {
    for i := 0; i < stackSize*3; i++ {
        if (i < stackSize) {
            push(0, i)
        } else if ((i >= stackSize) && (i < 2*stackSize)) {
            push(1, i)
        } else {
            push(2, i)
        }
    }
    for i := 0; i < stackSize*3; i++ {
        if (i == 0 || i == stackSize || i == 2*stackSize ) {
            stackNumber := 0
            if i != 0 {
                stackNumber = i/stackSize
            }
            fmt.Printf("\nStack(%v) Start: \n", stackNumber)
        }
        if (i < stackSize) {
            printStackTopAndPop(0)
        } else if (i >= stackSize && i < 2*stackSize) {
            printStackTopAndPop(1)
        } else {
            printStackTopAndPop(2)
        }
    }
}

func printStackTopAndPop(stackNum int) {
    val, err := peek(stackNum)
    if( err == nil ) {
        fmt.Printf(" [ %v ] \n", val)
        pop(stackNum)
    } else {
        fmt.Println(err)
    }
}
