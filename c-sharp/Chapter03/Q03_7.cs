
using ctci.Contracts;
using System;
using System.Collections.Generic;

namespace Chapter03
{
    public class Q03_7 : IQuestion
    {
        abstract class Animal
        {
            int _order;
            protected readonly string Name;

            protected Animal(String name)
            {
                Name = name;
            }

            public abstract String GetName();

            public void SetOrder(int order)
            {
                _order = order;
            }

            public int GetOrder()
            {
                return _order;
            }

            public bool IsOlderThan(Animal animal)
            {
                return _order < animal.GetOrder();
            }
        }

        class Cat : Animal 
        {
	        public Cat(String name) :
                base(name)
            {}

            public override String GetName()
            {
		        return "Cat: " + Name;
	        }
        }

        class Dog : Animal 
        {
	        public Dog(String name) :
                base(name)
            {}

            public override String GetName()
            {
		        return "Dog: " + Name;
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

            public void Enqueue(Animal animal) 
            {
		        animal.SetOrder(_order);
		        _order++;

		        if (animal.GetType() == typeof(Dog))
                {
			        _dogs.Add((Dog) animal);
                }
                else if (animal.GetType() == typeof(Cat))
                {
			        _cats.Add((Cat)animal);
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

                var dog = _dogs[0];
                var cat = _cats[0];

                if (dog.IsOlderThan(cat))
                {
                    var d = _dogs[0];
                    _dogs.RemoveAt(0);

                    return d;
                }
                else
                {
                    var c = _cats[0];
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

                var dog = _dogs[0];
                var cat = _cats[0];

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
                var dog = _dogs[0];
                _dogs.RemoveAt(0);

                return dog;
            }

            public Dog PeekDogs()
            {
                return _dogs[0];
            }

            public Cat DequeueCats()
            {
                var cat = _cats[0];
                _cats.RemoveAt(0);

                return cat;
            }

            public Cat PeekCats()
            {
                return _cats[0];
            }
        }

        public void Run()
        {
		    var animals = new AnimalQueue();
		    animals.Enqueue(new Cat("Callie"));
		    animals.Enqueue(new Cat("Kiki"));
		    animals.Enqueue(new Dog("Fido"));
		    animals.Enqueue(new Dog("Dora"));
		    animals.Enqueue(new Cat("Kari"));
		    animals.Enqueue(new Dog("Dexter"));
		    animals.Enqueue(new Dog("Dobo"));
		    animals.Enqueue(new Cat("Copa"));
		
            Console.WriteLine("Peek a dog and cat:");
            Console.WriteLine(animals.PeekDogs().GetName());
            Console.WriteLine(animals.PeekCats().GetName());
            Console.WriteLine();

		    Console.WriteLine(animals.DequeueAny().GetName());
            Console.WriteLine(animals.DequeueAny().GetName());
            Console.WriteLine(animals.DequeueAny().GetName());	
		
		    animals.Enqueue(new Dog("Dapa"));
		    animals.Enqueue(new Cat("Kilo"));
		
		    while (animals.Size() != 0) 
            {
                Console.WriteLine(animals.DequeueAny().GetName());	
		    }
        }
    }
}