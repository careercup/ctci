def stringfiller(s):
    """
    Returns a new string with spaces replaced by '%20'
    """
    return ''.join(s.replace(' ', '%20'))

def stringfiller2(s):
    """
    Builds an empty string of appropriate size then sets appropriate
    characters at appropriate index.
    Time: O(n)
    Space O(n)
    """
    true_length = len(filter(lambda x: x == " ", s)) + len(s)
    new_string = [None] * true_length
    leader = 0 
    for index, char in enumerate(s):
        index_plus = index + leader
        if char == " ":
            new_string[index_plus:index_plus + 2] = list("%20")
            leader += 2
        else:
            new_string[index_plus] = char
    return ''.join(new_string)
        

if __name__ == "__main__":
    print stringfiller('hello my name is chris')
    print stringfiller2('hello my name is chris')
