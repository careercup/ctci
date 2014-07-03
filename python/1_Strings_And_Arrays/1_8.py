def isSubstring(s1, s2):
    return True if s1 in s2 else False

def is_rotation(s1, s2):
    """
    Determines if s1 is a substring of s2 by doubling s2. 
    if s1 = xy, and s2 = yx, s1(xy) will always be a substring of s2s2(yxyx).
    """
    return isSubstring(s1, s2 + s2)

if __name__ == "__main__":
    s1, s2 = 'waterbottle', 'terbottlewa'
    s3, s4 = 'chris', 'sirhc'
    print "{0} => {1} ? {2}".format(s1, s2, is_rotation(s1, s2))
    print "{0} => {1} ? {2}".format(s3, s4, is_rotation(s3, s4))

