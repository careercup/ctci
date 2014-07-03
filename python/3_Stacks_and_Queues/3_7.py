"""
3.7

An animal shelter holds only dogs and cats, and operates on a strictly "first in
first out" basis. People must adopt either the "oldest" (based on arrival time) 
of all animals at the shelter, or they can select whether they would prefer a
dog or a cat (and will receive the oldest item of that type). They can not select
which specific animal they would like. Create the data structures to maintain
this system and implement operations such as enqueue, dequeueAny, dequeueDog and
dequeueCat. You may use the built-in LinkedList data structure.
"""
from classes import Queue, Node, Stack

class SpecialQueue(Queue):
    """
    Regular queue only has enqueue and dequeue methods. Need a method to be able
    to add things front of the queue.
    """
    def add_to_front(self, data):
        newNode = Node(data)
        firstNode = self.first
        self.first = newNode
        self.first.nextNode = firstNode

class AnimalQueue(object):
    def __init__(self):
        self.all = SpecialQueue()
        self.cats = Queue()
        self.dogs = Queue()

    def eq(self, animal):
        assert type(animal) in (Cat, Dog), 'Only cats and dogs accepted here!'
        self.all.eq(animal)
        self.cats.eq(animal) if type(animal) is Cat else self.dogs.eq(animal)
        animalType = animal.__class__.__name__
        print '{0} the {1} has been added to the shelter'.format(animal.name, animalType)

    def dq_cat(self):
        cat = self.cats.dq()
        self.remove_from_all(cat)
        return cat

    def dq_dog(self):
        dog = self.dogs.dq()
        self.remove_from_all(dog)
        return dog

    def dq_any(self):
        animal = self.all.dq()
        self.cats.dq() if type(animal) is Cat else self.dogs.dq()
        return animal

    def remove_from_all(self, animal):
        temp_kennel = Stack()
        oldest = self.all.dq()
        while type(oldest) != type(animal):
            temp_kennel.push(oldest)
            oldest = self.all.dq()
        while temp_kennel.size > 0:
            self.all.add_to_front(temp_kennel.pop())



class Animal(object):
    def __init__(self, name):
        self.name = name


class Cat(Animal):
    pass


class Dog(Animal):
    pass


if __name__ == "__main__":
    shelter = AnimalQueue()
    b, c, d, e = Dog('Spot'), Cat('Red'), Dog('Otis'), Cat('Grey')
    shelter.eq(b)
    shelter.eq(c)
    shelter.eq(d)
    shelter.eq(e)
    print shelter.dq_cat().name
