##  ((n & (n-1)) == 0)

### Explanation:
[Example code which is already Implemented](https://github.com/AlgorithmCrackers/Interview-Questions/blob/master/Bit-Hacks/NextPowerof2/NextPowerOf2.swift)

````
Any power of 2 minus 1 is all ones: (2 N - 1 = 111....b)

2 = 2^1.  2-1 = 1 (1b)
4 = 2^2.  4-1 = 3 (11b)
8 = 2^3.  8-1 = 7 (111b)
Take 8 for example. 1000 & 0111 = 0000

So that expression tests if a number is NOT a power of 2.

````

Reference:
[Stack overflow](http://stackoverflow.com/questions/1053582/how-does-this-bitwise-operation-check-for-a-power-of-2)