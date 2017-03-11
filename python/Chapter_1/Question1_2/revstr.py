def revStr(s):
    return s[::-1]

if __name__ == '__main__':
    words = ('mary', 'anna', 'peter')
    for w in words:
        print('revStr({}): {}'.format(w, revStr(w)))
