def compressor(word):
    """
    Return a compressed version of string if shorter, else return string.
    Time complexity: O(n)
    Space complexity: O(n)
    """
    holder = LetterHolder()
    last_char = None
    for char in word:
        if char == last_char:
            holder.increment()
        else:
            holder.new_character(char)
        last_char = char

    holder.append() #Append final (letter, count)
    new_word = holder.to_string()
    return word if len(word) < len(new_word) else new_word

class LetterHolder(object):
    """
    Translates 'aaabb' into 'a3b2' by holding a list of [(letter, count)]
    """
    def __init__(self):
        self._letters = []
        self._current = None

    @property
    def letters(self):
        return self._letters

    def new_character(self, char):
        if self._current:
            self.append()
        self._current = char
        self._count = 1

    def increment(self):
        self._count += 1

    def append(self):
        self._letters.append((self._current, self._count))

    def to_string(self):
        allstrings = map(lambda x: x[0] + str(x[1]), self._letters)
        new_word = [item for sublist in allstrings for item in sublist]
        return ''.join(new_word)


if __name__ == "__main__":
    str1 = 'aaaabbbcccdddddaaa'
    str2 = 'chriss'
    str3 = 'zzzzzzzz'

    print "{0} => {1}".format(str1, compressor(str1))
    print "{0} => {1}".format(str2, compressor(str2))
    print "{0} => {1}".format(str3, compressor(str3))

