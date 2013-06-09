#Implement a method to perform basic string compression using the counts of repeated characters

#aabcccccaa would become a2blc5a3.

#do nothing if this would not make the string smaller.


def simpleCompress(compstring):
    #Avoid using the + and += operators to accumulate a string within a loop. Since strings are immutable, this creates unnecessary temporary objects and results in quadratic rather than linear running time. Instead, add each substring to a list and ''.join the list after the loop terminates (or, write each substring to a cStringIO.StringIO buffer).
    #Google python style guidelines http://google-styleguide.googlecode.com/svn/trunk/pyguide.html
    outstring=[]
    lastchar=""
    charcount=0
    for char in compstring:
        if char==lastchar:
            charcount += 1
        else:
            if lastchar != "":
                outstring.append(lastchar + str(charcount))
            charcount = 1
        lastchar=char            
    #final write
    outstring.append(lastchar + str(charcount))
    outstring="".join(outstring)
    if len(outstring)<len(compstring):
        return outstring
    else:
        return compstring

#testing

tocompress = "aabcccccaaa"

if simpleCompress(tocompress) == "a2b1c5a3":
    print "Test 1 Passed"
else:
    print "Test 1 Failed"

tocompress2 = "aabca"
if simpleCompress(tocompress2) == tocompress2:
    print "Test 2 Passed"
else:
    print "Test 2 Failed"

