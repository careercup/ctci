#Write a method to replace all spaces in a string with '%20'.
#Treat the string as a char array to make it challenging. Otherwise you would just use string replacement.
#Assume the char array has 2 spaces at the end for every one space in the body, so that you dont have to resize the array.

#making an interface to use the back of the array as a queue
class BackQueue:
    def __init__(self, instring):
        self.instring = instring
        self.queuelength = 0
        
    def addToQueue(self,char):
        #find first open space from end and add the char
        backindex=(len(self.instring)-1)-self.queuelength
        self.instring[backindex]=char
        self.queuelength += 1
        
    def getFromQueue(self):
        #pop the queue
        returnchar = self.instring[len(self.instring)-1]
        self.shiftQueue()
        self.queuelength -= 1
        return returnchar

    def shiftQueue(self):        
        backindex=len(self.instring)-1
        shiftcount=0
        while shiftcount<self.queuelength:
            self.instring[backindex]=self.instring[backindex-1]
            backindex -= 1
            shiftcount += 1
        
def changeSpacesForURL(spacestring):
    index=0
    bqueue = BackQueue(spacestring)
    
    while index<len(spacestring):
        if (index + bqueue.queuelength) == len(spacestring):
            #we need to operate differently if the back queue is full. direct transfer.
            spacestring[index]=bqueue.getFromQueue()
        else:
            thischar=spacestring[index]
            if bqueue.queuelength>0:            
                spacestring[index]=bqueue.getFromQueue()
                if thischar==" ":
                    bqueue.addToQueue("%")
                    bqueue.addToQueue("2")
                    bqueue.addToQueue("0")
                else:
                    bqueue.addToQueue(thischar)
            else:
                #we need to operate differently depending on if the back queue is empty (direct transfer instead of using queue).
                if thischar==" ":
                    spacestring[index]="%"
                    bqueue.addToQueue("2")
                    bqueue.addToQueue("0")
                else:
                    spacestring[index]=thischar
        index += 1
    return spacestring


    
#testing

inputstring = ["M","r"," ","J","o","h","n"," ","S","m","i","t","h"," "," "," "," "]
expectedoutputstring = ["M","r","%","2","0","J","o","h","n","%","2","0","S","m","i","t","h"]

outstring=""
for char in changeSpacesForURL(inputstring):
    outstring = outstring+char

expectedoutstring=""
for char in expectedoutputstring:
    expectedoutstring = expectedoutstring+char

if outstring == expectedoutstring:
    print "Passed Test 1"


#edge case where string is all spaces, 2 that need to be replaced, and 4 for the expansion room, 6 spaces total
inputstring = [" "," "," "," "," "," "]
expectedoutputstring = ["%","2","0","%","2","0"]

outstring=""
for char in changeSpacesForURL(inputstring):
    outstring = outstring+char

expectedoutstring=""
for char in expectedoutputstring:
    expectedoutstring = expectedoutstring+char

if outstring == expectedoutstring:
    print "Passed Test 2"
