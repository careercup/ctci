def unique(s, totalLetters=128):
    """
    Returns boolean for whether all characters in a string are unique.
    Time: O(n)
    Space: O(n)
    """
    if len(s) > totalLetters:
        return False

    letters = {}  #Make boolean hashtable of size = totalLetters
    for letter in s:
        if letter in letters:
            return False
        letters[letter] = True
    return True

def unique2(s):
    """
    Returns boolean for whether all characters in a string are unique.
    Time: O(n*log(n))
    Space: O(1)
    """
    sorted_string = ''.join(sorted(s))
    for index, letter in enumerate(sorted_string):
        try:
            if sorted_string[index] == sorted_string[index + 1]:
                return False
        except:
            pass
    return True


if __name__ == "__main__":
    print '"Chris" unique? ' + str(unique('Chris'))
    print '"Hello" unique? ' + str(unique('Hello'))
