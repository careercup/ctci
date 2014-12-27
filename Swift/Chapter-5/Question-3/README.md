 ## Question 5_3
 ```
 Given a positive integer, print the next smallest and the next largest number that have the same number of 1 bits in their binary representation.

```

###Algorithm:
Step by step illustration:
```
10011100
00011100 - right most string of 1's in x
00000011 - right shifted pattern except left most bit ------> [A]
00010000 - isolated left most bit of right most 1's pattern
00100000 - shiftleft-ed the isolated bit by one position ------> [B]
10000000 - left part of x, excluding right most 1's pattern ------> [C]
10100000 - add B and C (OR operation) ------> [D]
10100011 - add A and D which is required number 163
```

### Reference:

[GeeksforGeeks c solution](http://www.geeksforgeeks.org/next-higher-number-with-same-number-of-set-bits/)