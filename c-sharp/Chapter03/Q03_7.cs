using System;
using System.Collections.Generic;
using ctci.Contracts;

namespace Chapter03
{
    public class Q03_7 : IQuestion
    {
        abstract class Animal
        {
            int _order;
            protected readonly string _name;

            protected Animal(String n)
            {
                _name = n;
            }

            public abstract String GetName();

            public void SetOrder(int ord)
            {
                _order = ord;
            }

            public int GetOrder()
            {
                return _order;
            }

            public bool IsOlderThan(Animal a)
            {
                return _order < a.GetOrder();
            }
        }

        class Cat : Animal {
	        public Cat(String n) :
                base(n)
            {}

            public override String GetName()
            {
		        return "Cat: " + _name;
	        }
        }

        class Dog : Animal {
	        public Dog(String n) :
                base(n)
            {}

            public override String GetName()
            {
		        return "Dog: " + _name;
	        }
        }

        class AnimalQueue
        {
            readonly List<Dog> _dogs = new List<Dog>();
            readonly List<Cat> _cats = new List<Cat>();
            int _order;

            public AnimalQueue()
            {
                _order = 0;
            }

            public void Enqueue(Animal a) {
		        a.SetOrder(_order);
		        _order++;
		        if (a.GetType() == typeof(Dog))
                {
			        _dogs.Add((Dog) a);
                }
                else if (a.GetType() == typeof(Cat))
                {
			        _cats.Add((Cat)a);
		        }
	        }

            public Animal DequeueAny()
            {
                if (_dogs.Count == 0)
                {
                    return DequeueCats();
                }
                else if (_cats.Count == 0)
                {
                    return DequeueDogs();
                }
                Dog dog = _dogs[0];
                Cat cat = _cats[0];
                if (dog.IsOlderThan(cat))
                {
                    Dog d = _dogs[0];
                    _dogs.RemoveAt(0);
                    return d;
                }
                else
                {
                    Cat c = _cats[0];
                    _cats.RemoveAt(0);
                    return c;
                }
            }

            public Animal Peek()
            {
                if (_dogs.Count == 0)
                {
                    return _cats[0];
                }
                else if (_cats.Count == 0)
                {
                    return _dogs[0];
                }
                Dog dog = _dogs[0];
                Cat cat = _cats[0];
                if (dog.IsOlderThan(cat))
                {
                    return dog;
                }
                else
                {
                    return cat;
                }
            }

            public int Size()
            {
                return _dogs.Count + _cats.Count;
            }

            public Dog DequeueDogs()
            {
                Dog d = _dogs[0];
                _dogs.RemoveAt(0);

                return d;
            }

            public Dog PeekDogs()
            {
                return _dogs[0];
            }

            public Cat DequeueCats()
            {
                Cat c = _cats[0];
                _cats.RemoveAt(0);

                return c;
            }

            public Cat PeekCats()
            {
                return _cats[0];
            }
        }

        public void Run()
        {
		    AnimalQueue animals = new AnimalQueue();
		    animals.Enqueue(new Cat("Callie"));
		    animals.Enqueue(new Cat("Kiki"));
		    animals.Enqueue(new Dog("Fido"));
		    animals.Enqueue(new Dog("Dora"));
		    animals.Enqueue(new Cat("Kari"));
		    animals.Enqueue(new Dog("Dexter"));
		    animals.Enqueue(new Dog("Dobo"));
		    animals.Enqueue(new Cat("Copa"));
		
		    Console.WriteLine(animals.DequeueAny().GetName());
            Console.WriteLine(animals.DequeueAny().GetName());
            Console.WriteLine(animals.DequeueAny().GetName());	
		
		    animals.Enqueue(new Dog("Dapa"));
		    animals.Enqueue(new Cat("Kilo"));
		
		    while (animals.Size() != 0) {
                Console.WriteLine(animals.DequeueAny().GetName());	
		    }
        }
    }
}
