 ## Question 5_7
 ```
 /*An array A contains all the integers from 0 through n, except for one number which is missing. In this problem, we cannot access an entire integer in A with a single opera- tion. The elements of A are represented in binary, and the only operation we can use toaccessthemis"fetchthejthbitofAfi]," whichtakesconstanttime.Writecodeto find the missing integer. Canyou do it in 0(n) time?
````
Algorithm
```
Start with least sign bit.
1. Count occurrence of 1's vs 0's.
2. There are 3 possibilities:

n is odd, so the number of 0 bits and 1 bits should be the same. They won't be, so the lower number is obviously the missing one.
n is even, so the number of 0 bits should be 1 greater than the number of 1 bits. If they're equal, it's the 0 bit that's missing.
As above, n is even. If the number of 0 bits is 2 greater than the number of 1 bits, the 1 bit is the missing one.
3.If count(1) < count(0) => the missing number has a 1 as it's least sig bit, else it has a 0.
4.Remove all numbers with least sig bit not matching result found in step 3.
5.Repeat steps 1->4, iterating from least sig bit -> 2nd least sig bit -> ... -> most sig bit
```


