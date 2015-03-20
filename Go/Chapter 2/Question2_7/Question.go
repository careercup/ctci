package main
// implement a function to check if linkedlist is a palindrome

import (
    "../list"
    "../stack"
    "fmt"
)
/*
    Add the elements till the middle of LL to a stack and check the rest elements
*/
func isPalindrome(l *list.List) bool {
    pslow := l.Front() // stops at the middle
    pfast := l.Front() // hits the end
    stack := new(stack.Stack)
    for (pfast != nil && pfast.Next != nil) {
        stack.Push(pslow.Data)
        pslow = pslow.Next
        pfast = pfast.Next.Next
    }
    /* odd no of elems, should not check the middle element */
    if (pfast != nil) {
        pslow = pslow.Next
    }
    for (pslow != nil) {
        if(pslow.Data != stack.Pop()) {
            return false
        }
        pslow = pslow.Next
    }
    return true
}

func main() {
    lodd := list.ParseAndBuildList("3->2->1->2->3")
    leven := list.ParseAndBuildList("4->3->2->2->3->4")
    lnotPal := list.ParseAndBuildList("7->3->2->3->6")
    if ( isPalindrome(lodd) && isPalindrome(leven) && !isPalindrome(lnotPal) ) {
        fmt.Printf(" Tests Pass ")
    } else {
        fmt.Printf(" Tests Fail ")
    }
}
