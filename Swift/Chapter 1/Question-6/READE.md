## Question
```
Given an image represented by an NxN matrix, where each pixel in the image is 4
bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
```
## Algorithm:
```
1) Get the transpose of the input
2) swap first and Nth column, second and N-1th column until u reach the N/2th column
```