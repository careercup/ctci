def rotator(matrix):
    """Returns the original matrix rotated by 90 degrees."""
    return zip(*matrix[::-1])

if __name__ == "__main__":
    row1 = (1, 2, 3)
    row2 = (4, 5, 6)
    row3 = (7, 8, 9)
    matrix = (row1, row2, row3)
    rotated = rotator(matrix)
    
    print """
    {0} => Original
    {1}
    {2}

    {3} => Rotated
    {4}
    {5}
    """.format(matrix[0], matrix[1], matrix[2],
               rotated[0], rotated[1], rotated[2])
