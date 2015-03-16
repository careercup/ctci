package main
/*
    Write code to remove duplicates from an unsorted linked list.

    FOLLOW UP
    How would you solve this problem if a temporary buffer is not allowed?
*/
import (
    "../list" //  this implements a doubly linked list
    "fmt"
)

// o(n) space & time
func removeDuplicates(l *list.List) {
    if (l.Front() == nil) {
        return
    }
    set := make(map[int]bool) // a map of boolean values can be used as a set-like data structure
    var prevE *list.Node
    for e := l.Front(); e != nil; e = e.Next {
        val := e.Data
        if set[val] { // detected a duplicate
            prevE.Next = e.Next
            l.DecrementLen()
        } else {
            set[val] = true
            prevE = e
        }
    }
}
// o(n^2) time o(1) space
func removeDuplicatesB(l *list.List) {
    if (l.Front() == nil) {
        return
    }
    /* Pick elements one by one */
    current := l.Front()
    for current != nil {
        /* Compare the picked element with rest of the elements */
        runner := current
        for runner.Next != nil {
            if(runner.Next.Data == current.Data) {
                runner.Next = runner.Next.Next
                l.DecrementLen()
            } else {
                runner = runner.Next
            }
        }
        current = current.Next
    }
}

func buildListWithDuplicates() *list.List {
    l := new(list.List)
	l.PushFront(5)
	l.PushFront(7)
	l.PushFront(6)
	l.PushFront(5)
	l.PushFront(4)
    l.PushFront(3)
    l.PushFront(4)
    return l
}

func main() {
    l1 := buildListWithDuplicates(); fmt.Printf("Before           : %v\n", l1)
    removeDuplicates(l1); fmt.Printf("removeDuplicates : %v\n", l1)
    l2 := buildListWithDuplicates(); fmt.Printf("Before           : %v\n", l2)
    removeDuplicatesB(l2); fmt.Printf("removeDuplicatesB: %v\n", l2)
}
