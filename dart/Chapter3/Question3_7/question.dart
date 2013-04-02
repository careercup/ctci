import "../../utils/linked_list_node.dart";

abstract class Animal {
  int _order;
  String _name;
  Animal(this._name);

  String get name;

  set order(int value) => _order = value;
  int get order => _order;

  bool isOlderThan(Animal a) => order < a.order;
}

class Cat extends Animal {
  Cat(String name): super(name);
  String get name => "Cat: ${super._name}";
}

class Dog extends Animal {
  Dog(String name) : super(name);
  String get name => "Dog: ${super._name}";
}

class AnimalQueue {
  int _order = 0;
  List<Dog> dogs = new List<Dog>();
  List<Cat> cats = new List<Cat>();

  void enqueue(Animal a) {
    a.order = _order;
    _order++;
    if (a is Dog) {
      dogs.add(a);
    } else if (a is Cat) {
      cats.add(a);
    }
  }

  Animal dequeueAny() {
    if (dogs.length == 0) {
      return dequeueCats();
    } else if (cats.length == 0) {
      return dequeueDogs();
    }

    Dog dog = dogs.first;
    Cat cat = cats.first;

    if (dog.isOlderThan(cat)) {
      return dogs.removeAt(0);
    } else {
      return cats.removeAt(0);
    }
  }

  Animal peek() {
    if (dogs.length == 0) {
      return cats.last;
    } else if (cats.length == 0) {
      return dogs.last;
    }

    Dog dog = dogs.last;
    Cat cat = cats.last;
    if (dog.isOlderThan(cat)) {
      return dog;
    } else {
      return cat;
    }
  }

  int size() => dogs.length + cats.length;

  Dog dequeueDogs() => dogs.removeAt(0);
  Dog peekDogs() => dogs.last;
  Cat dequeueCats() => cats.removeAt(0);
  Cat peekCats() => cats.last;
}

void main() {

  AnimalQueue animals = new AnimalQueue();
  animals.enqueue(new Cat("Callie"));
  animals.enqueue(new Cat("Kiki"));
  animals.enqueue(new Dog("Fido"));
  animals.enqueue(new Dog("Dora"));
  animals.enqueue(new Cat("Kari"));
  animals.enqueue(new Dog("Dexter"));
  animals.enqueue(new Dog("Dobo"));
  animals.enqueue(new Cat("Copa"));

  print(animals.dequeueAny().name);
  print(animals.dequeueAny().name);
  print(animals.dequeueAny().name);

  animals.enqueue(new Dog("Dapa"));
  animals.enqueue(new Cat("Kilo"));

  while (animals.size() != 0) {
    print(animals.dequeueAny().name);
  }
}