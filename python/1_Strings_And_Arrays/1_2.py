def reverse_C(s):
    """
    Reverse a null-terminated string.
    String needs to end in None or *.
    """
    assert s[-1] == None or s[-1] == '*', \
        'Needs to be null-terminated with "*" or None'
    return s[:-1][::-1] + s[-1:]


if __name__ == "__main__":
    s1 = ['s', 't', 'r', None]
    s2 = ['c', 'h', 'r', 'i', 's', '*']
    print '["s", "t", "r", None] => ' + str(reverse_C(s1))
    print 'list("chris*") => ' + str(reverse_C(s2))



