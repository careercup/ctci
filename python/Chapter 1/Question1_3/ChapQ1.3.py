#Given two strings, write a method to decide if one is a permutation of the other.

# O(n^2)
def isPermutation(s1, s2):
    if len(s1)!=len(s2):
        return False
    else:
        for char in s1:
            if s2.find(char)==-1:
                return False
            else:
                s2 = s2.replace(char,"",1)
        return True

# big O complexity depends on python list sort complexity, which should be better than O(n^2)
def isPermutationSort(s1,s2):
    #sort both strings, check if they are equal
    if len(s1)!=len(s2): return False
    return sorted(s1) == sorted(s2)

#helper function for the fucntion 'isPermutableHash' | O(n)
#Returns a dict with keys as different chars and their respective values being number of occurances.
def makeCharCountDict(s):
    CharCountDict={}
    for char in s:
        if char not in CharCountDict:
            CharCountDict[char]=1
        else:
            CharCountDict[char]+=1
    return CharCountDict

    

#O(n)
def isPermutationHash(s1,s2):
    #using a dict as a hash table to count occurences, then comparing the 2 dict
    charcountdict1 = makeCharCountDict(s1)
    charcountdict2 = makeCharCountDict(s2)
    
    if len(charcountdict1) != len(charcountdict2):
        return False
        
    if charcountdict1==charcountdict2:
        return True
    else:
        return False


    
#testing

#permutation
postest1 = ["abcdefgh","abcdefhg"]

#not permutation
negtest2 = ["abcdefgh","gfsdgsdffsd"]

#not permutation
negtest3 = ["abcdefgh","gfsdgsdf"]


#list of all functions to test
funclist = [isPermutation,isPermutationSort,isPermutationHash]

for func in funclist:
    print "Testing function " + str(func)    
    if func(postest1[0],postest1[1]):
        print "Test 1 passed"
    if not func(negtest2[0],negtest2[1]):
        print "Test 2 passed"
    if not func(negtest3[0],negtest3[1]):
        print "Test 3 passed"
                


