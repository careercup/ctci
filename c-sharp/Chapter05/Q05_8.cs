
using ctci.Contracts;
using System;

namespace Chapter05
{
    public class Q05_8 : IQuestion
    {
        public static int ComputeByteNum(int width, int x, int y)
        {
            return (width * y + x) / 8;
        }

        public static void DrawLine(byte[] screen, int width, int x1, int x2, int y)
        {
            var startOffset = x1 % 8;
            var firstFullByte = x1 / 8;

            if (startOffset != 0)
            {
                firstFullByte++;
            }

            var endOffset = x2 % 8;
            var lastFullByte = x2 / 8;

            if (endOffset != 7)
            {
                lastFullByte--;
            }

            // Set full bytes
            for (var b = firstFullByte; b <= lastFullByte; b++)
            {
                screen[(width / 8) * y + b] = (byte)0xFF;
            }

            var startMask = (byte)(0xFF >> startOffset);
            var endMask = (byte)~(0xFF >> (endOffset + 1));

            // Set start and end of line
            if ((x1 / 8) == (x2 / 8))
            { 
                // If x1 and x2 are in the same byte
                var mask = (byte)(startMask & endMask);
                screen[(width / 8) * y + (x1 / 8)] |= mask;
            }
            else
            {
                if (startOffset != 0)
                {
                    var byteNumber = (width / 8) * y + firstFullByte - 1;
                    screen[byteNumber] |= startMask;
                }
                if (endOffset != 7)
                {
                    var byteNumber = (width / 8) * y + lastFullByte + 1;
                    screen[byteNumber] |= endMask;
                }
            }
        }

        public static void PrintByte(byte b)
        {
		    for (var i = 7; i >= 0; i--) 
            {
			    Console.Write((b >> i) & 1);
		    }
	    }

        public static void PrintScreen(byte[] screen, int width) 
        {
		    var height = screen.Length * 8 / width;

            for (var r = 0; r < height; r++) 
            {
                for (var c = 0; c < width; c += 8) 
                {
                    var b = screen[ComputeByteNum(width, c, r)];
				    PrintByte(b);
			    }

			    Console.WriteLine("");
		    }
	    }

        public void Run()
        {
            const int width = 8 * 4;
            const int height = 15;
            var screen = new byte[width * height / 8];
            //screen[1] = 13;

            DrawLine(screen, width, 8, 10, 2);

            PrintScreen(screen, width);
        }
    }
}