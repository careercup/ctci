
using ctci.Contracts;
using System;

namespace Chapter07
{
    public class Q07_4 : IQuestion
    {
	    /* Flip a positive sign to negative, or a negative sign to pos */
	    public static int Negate(int number) 
        {
		    var negativeNumber = 0;
		    var d = number < 0 ? 1 : -1;

		    while (number != 0) 
            {
			    negativeNumber += d;
			    number += d;
		    }

	        return negativeNumber;
	    }

	    /* Subtract two numbers by negating b and adding them */
	    public static int Minus(int number1, int number2) 
        {
		    return number1 + Negate(number2);
	    }

	    /* Return absolute value */
	    public static int Abs(int number) 
        {
		    if (number < 0) 
            {
			    return Negate(number);
		    }
		
            return number;
	    }

	    /* Multiply number1 by number2 by adding number1 to itself number2 times */
	    public static int Multiply(int number1, int number2) 
        {
		    if (number1 < number2) 
            {
                // algo is faster if number2 < number1
			    return Multiply(number2, number1); 
		    }

		    var sum = 0;

		    for (var i = Abs(number2); i > 0; i--) 
            {
			    sum += number1;
		    }

		    if (number2 < 0)
            {
			    sum = Negate(sum);
		    }

		    return sum;
	    }

	    /* Divide a by b by literally counting how many times b can go into
	     * a. That is, count how many times you can add b to itself until you reach a. */
	    public static int Divide(int a, int b) 
        {
		    if (b == 0) 
            {
			    throw new ArithmeticException("ERROR: Divide by zero.");
		    }

		    var absa = Abs(a);
            var absb = Abs(b);

            var product = 0;
            var x = 0;

		    while (product + absb <= absa) 
            { /* don't go past a */
			    product += absb;
			    x++;
		    }
		
		    if ((a < 0 && b < 0) || (a > 0 && b > 0)) 
            {
			    return x;
		    } 

            return Negate(x);
	    }
	
	    public static int RandomInt(int number) 
        {
            var random = new Random(DateTime.Now.Millisecond);

            return (int)(random.Next(2) * number);
	    }

        public void Run()
        {
		    var q = Multiply(-5, -10);
		    Console.WriteLine(q);

            for (var i = 0; i < 100; i++) 
            {
                var a = RandomInt(10);
                var b = RandomInt(10);
                var ans = Minus(a, b);

                if (ans != a - b) 
                {
				    Console.WriteLine("ERROR");
			    }
			    Console.WriteLine(a + " - " + b + " = " + ans);
		    }

            for (var i = 0; i < 100; i++) 
            {
                var a = RandomInt(10);
                var b = RandomInt(10);
                var ans = Multiply(a, b);
			    
                if (ans != a * b) 
                {
				    Console.WriteLine("ERROR");
			    }
			    Console.WriteLine(a + " * " + b + " = " + ans);
		    }

            for (var i = 0; i < 100; i++)
            {
                var a = RandomInt(10) + 1;
                var b = RandomInt(10) + 1;
                Console.WriteLine(a + " / " + b + " = ");
                var ans = Divide(a, b);
			    
                if (ans != a / b) 
                {
				    Console.WriteLine("ERROR");
			    }
			    Console.WriteLine(ans);
		    }
        }
    }
}