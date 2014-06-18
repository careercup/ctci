def compress(string):
    previous_character = string[0]
    counter = 1
    result = ''
    for c in string[1:]:
        if c == previous_character:
            counter += 1
        else:
            result += previous_character + str(counter)
            previous_character = c
            counter = 1
    return result + c + str(counter)

if __name__ == '__main__':
    words = ('aabcccccaaa', 'aaabbbbcccccdee', 'abc', 'a', '', ' ', 'aabccdde', 'aab', 'aaabb')
    for w in words:
        print('compress({}): {}'.format(w, compress(w)))
