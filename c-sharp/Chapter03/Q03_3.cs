using System;
using System.Collections.Generic;
using ctci.Contracts;

namespace Chapter03
{
    public class Q03_3 : IQuestion
    {
        class Node
        {
            public Node Above {get; set;}
            public Node Below { get; set; }
            public int Value { get; set; }
            public Node(int value)
            {
                Value = value;
            }
        }

        class Stack
        {
            readonly int _capacity;
            public Node Top { get; set; }
            public Node Bottom { get; set; }
            public int Size {get; set;}

            public Stack(int capacity)
            {
                _capacity = capacity;
                Size = 0;
            }

            public bool IsFull()
            {
                return _capacity == Size;
            }

            public void join(Node above, Node below)
            {
                if (below != null) below.Above = above;
                if (above != null) above.Below = below;
            }

            public bool Push(int v)
            {
                if (Size >= _capacity) return false;
                Size++;
                Node n = new Node(v);
                if (Size == 1) Bottom = n;
                join(n, Top);
                Top = n;
                return true;
            }

            public int Pop()
            {
                Node t = Top;
                Top = Top.Below;
                Size--;
                return t.Value;
            }

            public bool IsEmpty()
            {
                return Size == 0;
            }

            public int RemoveBottom()
            {
                Node b = Bottom;
                Bottom = Bottom.Above;
                if (Bottom != null) Bottom.Below = null;
                Size--;
                return b.Value;
            }
        }

        class SetOfStacks
        {
            readonly List<Stack> _stacks = new List<Stack>();
            public int Capacity { get; set; }

            public SetOfStacks(int capacity)
            {
                Capacity = capacity;
            }

            public Stack GetLastStack()
            {
                if (_stacks.Count == 0)
                {
                    return null;
                }
                return _stacks[_stacks.Count - 1];
            }

            public void Push(int v)
            {
                Stack last = GetLastStack();
                if (last != null && !last.IsFull())
                { // add to last
                    last.Push(v);
                }
                else
                { // must create new stack
                    Stack stack = new Stack(Capacity);
                    stack.Push(v);
                    _stacks.Add(stack);
                }
            }

            public int Pop()
            {
                Stack last = GetLastStack();
                int v = last.Pop();
                if (last.Size == 0)
                {
                    _stacks.RemoveAt(_stacks.Count - 1);
                }
                return v;
            }

            public int PopAt(int index)
            {
                return LeftShift(index, true);
            }

            public int LeftShift(int index, bool removeTop)
            {
                Stack stack = _stacks[index];
                int removedItem;
                if (removeTop) removedItem = stack.Pop();
                else removedItem = stack.RemoveBottom();
                if (stack.IsEmpty())
                {
                    _stacks.RemoveAt(index);
                }
                else if (_stacks.Count > index + 1)
                {
                    int v = LeftShift(index + 1, false);
                    stack.Push(v);
                }
                return removedItem;
            }

            public bool IsEmpty()
            {
                Stack last = GetLastStack();
                return last == null || last.IsEmpty();
            }
        }

        public void Run()
        {
		    const int capacityPerSubstack = 5;
		    SetOfStacks set = new SetOfStacks(capacityPerSubstack);
		    for (int i = 0; i < 34; i++)
            {
			    set.Push(i);
		    }
		    for (int i = 0; i < 34; i++)
            {
			    Console.WriteLine("Popped " + set.Pop());
		    }
        }
    }
}
