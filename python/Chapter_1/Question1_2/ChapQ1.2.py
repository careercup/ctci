#Implement a function that reverses a string

#using recursion here to avoid recopying the string, as described in the discussion of "string buffer".

def reverseStringRecursive(str1):
    if str1 != "":
        return str1[-1:] + reverseStringRecursive(str1[:-1])
    else:
        return ""

#testing

palindrome = "abcdedcba"
nonpalindrome = "hello!"

#palindrome can be reversed and would still be equal to itself, by definition.
if palindrome == reverseStringRecursive(palindrome):
    print "Test 1 passed"
if nonpalindrome != reverseStringRecursive(nonpalindrome):
    print "Test 2 passed"
