// Author: Sini Tinfors (sinitin) <sini.tinfors@gmail.com>

/*
How would you design a stack which,
in addition to push and pop, also has a
function min which returns the minimum element?
Push, pop and min should all operate in O(1) time.
*/

package main

import (
	"fmt"
	"math/rand"
	"time"
)

var stackpointer = []int{-1, -1, -1}

type nodewithmin struct {
	value int
	min   int
}

func main() {
	var triplearr [30]nodewithmin
	rand.Seed(time.Now().UTC().UnixNano())

	//populate the three stacks
	for i := 0; i < 3; i++ {
		for j := 0; j < 10; j++ {
			val := random(0, 100)
			push(&triplearr, i, val)
		}
	}

	//print the three stacks
	for i := 0; i < 3; i++ {
		for j := 0; j < 10; j++ {
			fmt.Println(triplearr[j+(10*i)])
		}
		fmt.Println("")
	}

	a := min(&triplearr, 0)
	fmt.Println("The min value of stack 0 is: ")
	fmt.Printf("%v\n", a)

	b := min(&triplearr, 1)
	fmt.Println("The min value of stack 1 is: ")
	fmt.Printf("%v\n", b)

	c := min(&triplearr, 2)
	fmt.Println("The min value of stack 2 is: ")
	fmt.Printf("%v\n", c)
}

func peek(s *[30]nodewithmin, stack int) (int, int) {
	if stackpointer[stack] == -1 {
		return -1, -1
	}

	return s[stackpointer[stack]+(stack*10)].min, s[stackpointer[stack]+(stack*10)].value
}

func push(s *[30]nodewithmin, stack, value int) {
	//check if empty
	if stackpointer[stack] == -1 {
		s[(stack * 10)].value = value
		s[(stack * 10)].min = value
		stackpointer[stack] = 0
	} else {

		s[stackpointer[stack]+(stack*10)+1].value = value
		i, _ := peek(s, stack)

		if i < value {

			s[(stack*10)+stackpointer[stack]+1].min = i
		} else {
			s[(stack*10)+stackpointer[stack]+1].min = value
		}

		stackpointer[stack] = stackpointer[stack] + 1
	}
}

func pop(s *[30]nodewithmin, stack int) nodewithmin {
	returnvalue := s[stackpointer[stack]]
	stackpointer[stack] = stackpointer[stack] - 1
	return returnvalue
}

func min(s *[30]nodewithmin, stack int) int {
	//check if empty
	if stackpointer[stack] == -1 {
		return -1
	} else {
		return s[stackpointer[stack]+(stack*10)].min
	}
}

func random(min int, max int) int {
	return min + rand.Intn(max-min)
}
