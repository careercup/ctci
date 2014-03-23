using System;

namespace ctci.Library
{
    public class BitVector
    {
        private const int DataSize = 32;
        public int Length { get; set; }
        private readonly int[] _vector;

        public BitVector(int length)
        {
            Length = length;
            _vector = length % DataSize == 0 
                ? new int[length / DataSize] 
                : new int[length / DataSize + 1];
        }

        public bool Set(int i)
        {
            int b = _vector[i / DataSize];
            int bitIndex = i % DataSize;
            //00100010
            if (((b >> bitIndex) & 1) == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void Print()
        {
		    foreach (int k in _vector) {
			    for (int i = 0; i < DataSize; i++) {
				    if ((k >> i & 1) == 1) {
					    Console.Write(1);
				    } else {
					    Console.Write(0);
				    }
			    }
			    Console.WriteLine();
		    }
	    }

        public void Set(int i, bool flag)
        {
            if (i >= 0 && i < Length)
            {
                int mask = ~(1 << i);
                int b = _vector[i / DataSize] & mask;
                if (flag)
                {
                    _vector[i / DataSize] = b | (1 << i);
                }
                else
                {
                    _vector[i / DataSize] = b;
                }
            }
        }
    }
}
