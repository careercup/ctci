def replaceSpaces(s):
    return '%20'.join(s.split())

if __name__ == '__main__':
    words = ( 'hello world    ', '   mr. john  ', '', ' ', )
    for w in words:
        print('replaceSpaces({}): {}'.format(w, replaceSpaces(w)))
