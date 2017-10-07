package main
/*
An animal shelter holds only dogs and cats, and operates on a strictly "first in,
first out" basis. People must adopt either the "oldest" (based on arrival time) of
all animals at the shelter, or they can select whether they would prefer a dog or
a cat (and will receive the oldest animal of that type). They cannot select which
specificanimal they would like. Create the data structures to maintain this system
and implement operations such as enqueue, dequeueAny, dequeueDog and
dequeueCat.
You may use the built-in LinkedList data structure.
*/
import (
    "../list"
    "fmt"
)
/* Dogs and Cats polymorphism */
type Being interface {
    String() string
    SetName(s string)
    SetOrder(o int)
    Name() string
    isOlder(other Being) bool
    Order() int
}
type Animal struct {
    name string
    order int
}
type Dog struct {
    Animal
}
type Cat struct {
    Animal
}
/* common methods */
func (a *Animal) SetName(s string) {
    a.name = s
}
func (a *Animal) SetOrder(o int) {
    a.order = o
}
func (a *Animal) Order() int {
    return a.order
}
func (a *Animal) Name() string {
    return a.name
}
func (a *Animal) isOlder(other Being) bool {
    return (a.Order() < other.Order())
}
func (a *Animal) String() string {
    return fmt.Sprintf("Animal: %v", a.name)
}
/* specific methods */
func (d *Dog) String() string {
    return fmt.Sprintf("Dog: %v", d.name)
}
func (c *Cat) String() string {
    return fmt.Sprintf("Cat: %v", c.name)
}
func NewDog(s string) *Dog {
    return &Dog{ Animal{s, 0} }
}
func NewCat(s string) *Cat {
    return &Cat{ Animal{s, 0} }
}
/* Animal shelter has two linkedlists */
type Shelter struct {
    dogs *list.List
    cats *list.List
    orderCount int
}

func NewShelter() *Shelter {
    return &Shelter{new(list.List), new(list.List), 0}
}

func (s *Shelter) enqueue(a Being) {
    s.orderCount++
    a.SetOrder(s.orderCount)
    //https://golang.org/doc/effective_go.html#type_switch
    switch t := a.(type) {
        case *Dog:
            s.dogs.PushBack(a)
        case *Cat:
            s.cats.PushBack(a)
        default:
            fmt.Println(fmt.Sprintf("Unknown Type %T - not added", t))
    }
}
func (s *Shelter) dequeueAny() Being {
    if s.dogs.Len() == 0 {
        return s.dequeueCat()
    } else if s.cats.Len() == 0 {
        return s.dequeueDog()
    }
    /* get the oldest */
    dog := s.dogs.Front().Data.(*Dog)
    cat := s.cats.Front().Data.(*Cat)
    if dog.isOlder(cat) {
        return s.dequeueDog()
    } else {
        return s.dequeueCat()
    }
}
func (s *Shelter) String() string {
    return fmt.Sprintf("Dogs List:\n%v\nCats List:\n%v\n", s.dogs, s.cats)
}
func (s *Shelter) dequeueDog() *Dog {
    return s.dogs.Poll().(*Dog)
}
func (s *Shelter) dequeueCat() *Cat {
    return s.cats.Poll().(*Cat)
}
func (s *Shelter) Len() int {
    return s.cats.Len() + s.dogs.Len()
}

func main() {
    s := NewShelter()
	s.enqueue(NewCat("Callie"))
	s.enqueue(NewCat("Kiki"))
	s.enqueue(NewDog("Fido"))
	s.enqueue(NewDog("Dora"))
	s.enqueue(NewCat("Kari"))
	s.enqueue(NewDog("Dexter"))
	s.enqueue(NewDog("Dobo"))
	s.enqueue(NewCat("Copa"))
    fmt.Println(s)
	fmt.Println(s.dequeueAny().Name()) // callie
	fmt.Println(s.dequeueAny().Name()) // kikie
	fmt.Println(s.dequeueAny().Name()) // fido

	s.enqueue(NewDog("Dapa"))
	s.enqueue(NewCat("Kilo"))

	for (s.Len() > 0) {
        fmt.Println(s.dequeueAny().Name())
	}
}
