def perm(s1, s2):
    """
    Returns boolean for whether S1 is a permutation of S2.
    Optimizations for speed
    Time: O(n*logn) -> O(1) BEST CASE
    Space: O(n)
    """
    #Use fastest methods first
    if len(s1) != len(s2): 
        return False #O(1) Time Complexity if false
    if sum(bytearray(s1)) != sum(bytearray(s2)): 
        return False #O(n) Time Complexity if false

    #Compare sorted chars as final resort, O(n*logn) Time Complexity
    sorted1, sorted2, = sorted(s1), sorted(s2)
    for index, char in enumerate(sorted1):
        if char != sorted2[index]:
            return False
    return True 


if __name__ == "__main__":
    print '"hi" and "ih" perm? ' + str(perm('hi', 'ih'))
    print '"hi" and "hello" perm? ' + str(perm('hi', 'hello'))
