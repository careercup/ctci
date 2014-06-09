def replaceSpaces(s):
    return '%20'.join(s.split())

def replace_spaces(string, size):
    return string[:size].replace(' ', '%20')

if __name__ == '__main__':
    words = ( 'hello world    ', '   mr. john  ', '', ' ', )
    for w in words:
        print('replaceSpaces({}): {}'.format(w, replaceSpaces(w)))
