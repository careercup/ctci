object Chapter3{

  case class ThreeStack[T](size:Int){
    case class StackNode(previous:Int, value:T)

    val stackArray : Array[StackNode] = new Array[StackNode](size)
    val stackPointer = Array(-1, -1, -1)
    var indexUsed : Int = 0
    var emptySlot : List[Int] = List()

    def isEmpty(stackNum:Int) : Boolean = {
      stackPointer(stackNum) == -1
    }

    def isFull(stackNum:Int) : Boolean = {
      indexUsed >= size
    }

    def pop(stackNum:Int): T = {
      if(!isEmpty(stackNum)) {
        val node = stackArray(stackPointer(stackNum))

        if(indexUsed == stackPointer(stackNum) + 1)
          indexUsed -= 1
        else
          emptySlot = stackPointer(stackNum) :: emptySlot

        stackPointer(stackNum) = node.previous
        node.value
      } else
        throw new Exception("stack is empty")
    }

    def push(stackNum:Int, value:T): Unit = {
      if (!isFull(stackNum)) {
        val lastIndex = stackPointer(stackNum)

        if (emptySlot.isEmpty) {
          stackPointer(stackNum) = indexUsed
          indexUsed += 1
        } else {
          stackPointer(stackNum) = emptySlot.head
          emptySlot = emptySlot.tail
        }

        stackArray(stackPointer(stackNum)) = StackNode(lastIndex, value)
      } else
        throw new Exception("stack is full")
    }
  }

  case class StackWithMin(size:Int){
    var stack   : List[Int] =  List()
    var minElemList : List[Int] = List()

    def isFull  = stack.length >= size
    def isEmpty = stack.isEmpty

    def push(value:Int) = {
      if(!isFull) {
        if (min() > value) {
          minElemList = value :: minElemList
        }
        stack = value :: stack
      } else
        throw new Exception("stack is pull")
    }

    def pop() : Int = {
      stack match {
        case h :: tail =>
          if (h == min()){
            minElemList = minElemList.tail
          }
          stack = tail

          h
        case Nil =>
          throw new Exception("stck is empty")
      }
    }

    def min() : Int = {
      if(minElemList.isEmpty)
        Int.MaxValue
      else {
        minElemList.head
      }
    }
  }

  case class Stack[T](size:Int) {
    private var list : List[T] = List[T]()

    def isEmpty : Boolean = list.isEmpty
    def isFull  : Boolean = list.length >= size

    def push(value:T)  = {
      if(!isFull){
        list = value :: list
      } else
        throw new Exception("Stack is full")
    }

    def pop : T = {
      list match {
        case h :: t  =>
          list = t
          h
        case Nil =>
          throw new Exception("Stack is empty")
      }
    }

    def peek : T  = {
      list match {
        case h :: t =>
          h
        case Nil =>
          throw new Exception("Stack is empty")
      }
    }

    override def toString = list.toString()

    def length = list.length
  }

  case class SetOfStacks[T](eachSize:Int){
    var setOfStacks : List[Stack[T]] = List[Stack[T]]()

    def isEmpty =
      setOfStacks.filter(!_.isEmpty) == Nil || setOfStacks.isEmpty

    def push(value:T) = {
      setOfStacks match {
        case stack :: stacks =>
          if (stack.isFull) {
            val newStack = new Stack[T](eachSize)
            newStack.push(value)
            setOfStacks = newStack :: setOfStacks
          } else {
            stack.push(value)
          }
        case Nil =>
          val newStack = new Stack[T](eachSize)
          newStack.push(value)
          setOfStacks = newStack :: setOfStacks
      }
    }

    def pop : T = {
      setOfStacks match {
        case h :: Nil =>
          if (h.isEmpty){
            setOfStacks = Nil
            throw new Exception("all stack are empty")
          } else {
            h.pop
          }
        case h :: t =>
          if (h.isEmpty){
            setOfStacks = t
            t.head.pop
          } else {
            h.pop
          }
        case Nil =>
          throw new Exception("all stacks are empty")
      }
    }

  }

  case class Tower(index:Int){
    val stack = Stack[Int](Int.MaxValue)

    def add(disk:Int) : Boolean = {
      if(!stack.isEmpty && stack.peek <= disk){
        println("Error placing disk : " + disk)
        false
      } else {
        stack.push(disk)
        true
      }
    }

    def moveTopTo(t:Tower) : Boolean = {
      if(stack.isEmpty) {
        println(s"no disk on tower $index")
        false
      } else {
        val top = stack.peek
        if (t.add(top)) {
          stack.pop
          true
        } else {
          println(s"cannot move top to tower ${t.index}")
          false
        }
      }
    }

    def moveDisks(n:Int, destination:Tower, buffer:Tower) : Boolean = {
      if(n > 0) {
        moveDisks(n-1, buffer, destination) &&
        moveTopTo(destination) &&
        buffer.moveDisks(n-1, destination, this)
      } else true
    }

    override def toString = {
      stack.toString()
    }
  }

  def TowerTest(): Unit = {
    val diskCntInATower : Int = 5
    val towerCnt  = 3
    val towers : Array[Tower] = new Array[Tower](towerCnt).map(_ =>new Tower(diskCntInATower))
    Range(diskCntInATower-1, -1,-1).foreach(i => towers(0).add(i))

    towers(0).moveDisks(diskCntInATower, towers(2), towers(1))
  }

  case class MyQueue[T](size:Int){
    val stack1 : Stack[T] = new Stack[T](size)
    val stack2 : Stack[T] = new Stack[T](size)
    var elemCnt = 0

    def isFull  = elemCnt >= size
    def isEmpty = elemCnt == 0

    def enqueue(value : T) = {
      if(!isFull) {
        stack1.push(value)
        elemCnt += 1
      } else {
        throw new Exception("queue is full")
      }
    }

    def dequeue : T = {
      if(!isEmpty){
        if(!stack2.isEmpty) {
          elemCnt -= 1
          stack2.pop
        } else {

          while(!stack1.isEmpty){
            val elem = stack1.pop
            stack2.push(elem)
          }

          elemCnt -= 1
          stack2.pop
        }
      } else {
        throw new Exception("queue is empty")
      }
    }

    def peek : T = {
      if(!isEmpty){
        if(!stack2.isEmpty)
          stack2.peek
        else {
          while(!stack1.isEmpty){
            val elem = stack1.pop
            stack2.push(elem)
          }
          stack2.peek
        }
      } else {
        throw new Exception("queue is empty")
      }
    }
  }

  def sort[T <% Ordered[T]] (stack:Stack[T]): Stack[T] = {
    val sortStack  = new Stack[T](stack.size)

    while(!stack.isEmpty){
      val tmpValue = stack.pop
      while(!sortStack.isEmpty && tmpValue < sortStack.peek){
        stack.push(sortStack.pop)
      }
      sortStack.push(tmpValue)
    }

    sortStack
  }

  abstract class Animal(name:String) extends Ordered[Animal]{
    var order : Int = Int.MaxValue

    def compare(that:Animal) = {
      order.compare(that.order)
    }

    def setOrder(o:Int) = {
      order = o
    }
  }

  case class Dog(name:String) extends Animal(name)
  case class Cat(name:String) extends Animal(name)

  class AnimalQueue{
    val dogQueue = MyQueue[Dog](Int.MaxValue)
    val catQueue = MyQueue[Cat](Int.MaxValue)
    var order = 0

    def enqueue(animal:Animal) = {
      animal.setOrder(order)
      order += 1
      animal match {
        case _ : Cat =>
          catQueue.enqueue(animal.asInstanceOf[Cat])
        case _ : Dog =>
          dogQueue.enqueue(animal.asInstanceOf[Dog])
      }
    }

    def dequeue : Animal = {
      if(dogQueue.isEmpty)
        catQueue.dequeue
      else if (catQueue.isEmpty)
        dogQueue.dequeue
      else {
        val cat = catQueue.peek
        val dog = dogQueue.peek

        if(cat > dog)
          dogQueue.dequeue
        else
          catQueue.dequeue
      }
    }

    def dequeueDog : Animal = dogQueue.dequeue
    def dequeueCat : Animal = catQueue.dequeue

  }

}


