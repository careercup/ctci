#Implement an algorithm to determine if a string has all unique characters.
#What if you cannot use additional data structures?


def hasAllUniqueCharsNoDS(inputstring):
    #no data structures
    #O(n^2)
    for char in inputstring:
        foundcount=0
        for char2 in inputstring:
            if char==char2:
                foundcount=foundcount+1
            if foundcount>1:
                return False
    return True

def hasAllUniqueCharsList(inputstring):
    #using a list
    #O(n^2)
    charlist = []
    for char in inputstring:
        #checking if char is in the list is O(n) according to http://wiki.python.org/moin/TimeComplexity
        if char in charlist:
            return False
        else:
            charlist.append(char)
    return True

def hasAllUniqueCharsList2(inputstring):
    #another way to use a list
    #O(n)
    if len(inputstring) > 256: #assume inputstring is ASCII
        return False
    else:
        charList = [False] * 256;
        for char in inputstring:
            if charList[ord(char)]:
                return False
            else:
                charList[ord(char)] = True
        return True

def hasAllUniqueChars(inputstring):
    #using a hash table (here as a dictionary of key/values)
    chardict = {}
    for char in inputstring:
        #checking if char is in the dict is O(1). In practice however, this is expected to perform worse than using lists for small numbers of n.
        if char in chardict:
            return False
        else:
            chardict[char]=True
    return True

def hasAllUniqueCharsSet(inputstring):
    #using a hash table (here as a set data structure)
    if len(inputstring) > 256: return False
    return len(set(inputstring)) == len(inputstring)
    
def hasAllUniqueCharsBitVector(inputstring):
    #using a bit vector
    #here as assumption in book, assume string only use  
    if len(inputstring) > 26: return False
    checker = 0
    for char in inputstring:
        if checker & (1 << ord(char)):
            return False
        checker |= (1 << ord(char))
    return True

#testing

#positive test case
teststringtrue = "abcdefghijkl"
#negative test case
teststringfalse = "aabvcgdfgbvxbj"

#list of all functions to test
funclist = [hasAllUniqueCharsNoDS,hasAllUniqueCharsList,hasAllUniqueCharsList2,hasAllUniqueChars, hasAllUniqueCharsSet, hasAllUniqueCharsBitVector]

for func in funclist:
    print "Testing function " + str(func)
    if func(teststringtrue):
        print "Test 1 passed"
    else:
        print "Test 1 failed"
    
    if not func(teststringfalse):
        print "Test 2 passed"
    else:
        print "Test 2 failed"
