
using ctci.Contracts;
using System;
using System.Collections.Generic;

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
                if (below != null)
                {
                    below.Above = above;
                }

                if (above != null)
                {
                    above.Below = below;
                }
            }

            public bool Push(int value)
            {
                if (Size >= _capacity)
                {
                    return false;
                }

                Size++;
                var node = new Node(value);

                if (Size == 1)
                {
                    Bottom = node;
                }

                join(node, Top);
                Top = node;
                
                return true;
            }

            public int Pop()
            {
                var top = Top;
                Top = Top.Below;
                Size--;

                return top.Value;
            }

            public bool IsEmpty()
            {
                return Size == 0;
            }

            public int RemoveBottom()
            {
                var bottomNode = Bottom;
                Bottom = Bottom.Above;

                if (Bottom != null)
                {
                    Bottom.Below = null;
                }
                
                Size--;
                
                return bottomNode.Value;
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

            public void Push(int value)
            {
                var last = GetLastStack();

                if (last != null && !last.IsFull())
                { 
                    // add to last
                    last.Push(value);
                }
                else
                { 
                    // must create new stack
                    var stack = new Stack(Capacity);
                    stack.Push(value);
                    _stacks.Add(stack);
                }
            }

            public int Pop()
            {
                var last = GetLastStack();
                var value = last.Pop();

                if (last.Size == 0)
                {
                    _stacks.RemoveAt(_stacks.Count - 1);
                }

                return value;
            }

            public int PopAt(int index)
            {
                return LeftShift(index, true);
            }

            public int LeftShift(int index, bool removeTop)
            {
                var stack = _stacks[index];
                var removedItem = (removeTop) ? stack.Pop() : stack.RemoveBottom();

                if (stack.IsEmpty())
                {
                    _stacks.RemoveAt(index);
                }
                else if (_stacks.Count > index + 1)
                {
                    var v = LeftShift(index + 1, false);
                    stack.Push(v);
                }

                return removedItem;
            }

            public bool IsEmpty()
            {
                var last = GetLastStack();
                
                return last == null || last.IsEmpty();
            }
        }

        public void Run()
        {
		    const int capacityPerSubstack = 5;
		    var set = new SetOfStacks(capacityPerSubstack);

            Console.WriteLine("IsEmpty? {0}", set.IsEmpty());

		    for (var i = 0; i < 34; i++)
            {
			    set.Push(i);
		    }
            Console.WriteLine("IsEmpty? {0}", set.IsEmpty());

		    for (var i = 0; i < 34; i++)
            {
                if (i == 0)
                {
                    set.PopAt(i);
                }
                else
                {
                    Console.WriteLine("Popped " + set.Pop());    
                }
		    }
        }
    }
}