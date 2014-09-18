#Implement a function that reverses a string

#using recursion here to avoid recopying the string, as described in the discussion of "string buffer".

def reverseStringRecursive(str1):
    if str1 != "":
        return str1[-1:] + reverseStringRecursive(str1[:-1])
    else:
        return ""

# My Solution
# There are also built in ways:
# inputString[::-1]
# "".join(reversed(inputString))
def reverseString(inputString):
  reversedString = ""
  for i in range(len(inputString)-1, -1, -1):
    reversedString +=  inputString[i]
  return reversedString

#testing

palindrome = "abcdedcba"
nonpalindrome = "hello!"

#palindrome can be reversed and would still be equal to itself, by definition.
if palindrome == reverseString(palindrome):
    print "Test 1 passed"
if "!olleh" == reverseString(nonpalindrome):
    print "Test 2 passed"
