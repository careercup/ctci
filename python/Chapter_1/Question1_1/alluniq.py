def allunique(s):
    charsTable = set()
    for c in s:
        if c in charsTable:
            return False
        charsTable.add(c)
    return True

def pairs(seq):
    n = len(seq)
    for i in range(n):
        yield seq[i], seq[(i + 1) % n]

def allunique2(s):
   srtStr = sorted(s)
   for (c1, c2) in pairs(srtStr):
       if c1 == c2:
           return False
   return True

if __name__ == '__main__':
    words = ('mary', 'ariadni')
    for w in words:
        print('allunique({}): {}'.format(w, allunique(w)))
        print('allunique2({}): {}'.format(w, allunique2(w)))
