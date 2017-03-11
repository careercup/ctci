#Assume you have a method isSubstring which checks if one word is a
#substring of another. Given two strings, s1 and s2, write code to check if s2 is
#a rotation of s1 using only one call to isSubstring (e.g.,"waterbottle" is a rotation of "erbottlewat").

def isSubstring(s1,s2):
    return s1.find(s2) > -1

def rotatedStringHasSubstring(s1,s2):
    #doubling the string ensures a complete substring regardless of rotation
    if len(s2)!=len(s1):
        return False
    doubles1 = s1 + s1
    return isSubstring(doubles1,s2)



#testing
if rotatedStringHasSubstring("waterbottle","erbottlewat"):
    print "Test 1 Passed"

if not rotatedStringHasSubstring("waterbottle","nope"):
    print "Test 2 Passed"

if not rotatedStringHasSubstring("waterbottlewater","waterbottle"):
    print "Test 3 Passed"
