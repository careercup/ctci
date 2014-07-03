#@zero_check <- decorator became obsolete
def zero_out(matrix):
    """
    If an element in an MxN matrix is 0, set the entire row and column to 0's.
    Time complexity: O(n)
    Space complexity: O(n)
    """
    zero_columns = []       # list is better for iterating over
    zero_rows = {}          # dict is better for checking membership O(1)

    # First pass to collect information on zeroes
    for index, row in enumerate(matrix):
        if 0 in row:
            zero_indexes = [i for i, x in enumerate(row) if x == 0]
            zero_columns.append(*zero_indexes)
            zero_rows[index] = True

    # Second pass to build intermediate matrix with row 0's
    int_matrix = [row[:] for row in matrix]
    for row_index, row in enumerate(int_matrix):
        if row_index in zero_rows:
            int_matrix[row_index] = [0] * len(row)

    # Third pass to build final matrix with column 0's
    final_matrix = [row[:] for row in int_matrix]
    for row in final_matrix:
        for col_index in zero_columns:
            row[col_index] = 0

    return final_matrix


if __name__ == "__main__":
    row1 = [1, 4, 0]
    row2 = [4, 5, 6]
    row3 = [0, 8, 9]
    matrix = [row1, row2, row3]
    zeroed = zero_out(matrix)
    
    print """
    {0} => Original
    {1}
    {2}

    {3} => Zeroed
    {4}
    {5}
    """.format(matrix[0], matrix[1], matrix[2],
               zeroed[0], zeroed[1], zeroed[2])

################################################################################
    
def zero_check(func):
    """
    **Decorator**
    O(nlogn) check to return the matrix early if it doesn't contain zeroes.
    Flattens the matrix to 1-D, sorts it, and checks if [0] == 0.

    I wrote this decorator hoping to optimize time complexity O(n^2) => O(nlogn) 
    but my solution ended up being O(n), so it ended up being unnecessary.
    """
    def wrapper(matrix):
        flat_sorted = sorted(reduce(lambda x, y: x + y, matrix))
        if flat_sorted[0] != 0:
            return matrix
        return func(matrix)
    return wrapper

