#Rotate a NxN matrix 90 degrees
#(assuming clockwise rotation)

class MatrixProcessor:

    def __init__(self, matrix):
        self.n=len(matrix)
        self.m=len(matrix[0])
        self.matrix = matrix

    def __str__(self):

        # Iterating over rows and the matrix via a generator,
        # and joining the cell and then row into the final string output
        return ''.join("%s%s%s" % ("[", ''.join("%s%s%s" % (" ", str(cell), " ")
                                                for cell in row), "]\n") for row in self.matrix)

    def rotate90CW(self):
        # strategy is to make what are now rows into columns, and reverse the order,
        # which mimics the effect of rotation on the matrix.
        # This creates our empty list of columns by the length of the original matrix
        columnlist = [[] for i in range(len(self.matrix))]
        # Now this iterates through the rows and columns and appends those to the new columnlist
        [[columnlist[i].append(row[i]) for i in range(len(row))] for row in self.matrix]
        # reverses the new column list to get the order that is wanted, and assigned back to the original matrix
        self.matrix = [reversed(col) for col in columnlist]

#testing
        
mat1= MatrixProcessor([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]])

print "M by N matrix has dimensions " + str(mat1.m) + " by " + str(mat1.n)

print "Visual representation of contents:"
print str(mat1)                  


mat1.rotate90CW()

print "Visual representation of contents after rotating 90 degrees clockwise:"
print str(mat1)                  


#sample output

##M by N matrix has dimensions 4 by 4
##Visual representation of contents:
##[ 1  2  3  4 ]
##[ 5  6  7  8 ]
##[ 9  10  11  12 ]
##[ 13  14  15  16 ]
##
##Visual representation of contents after rotating 90 degrees clockwise:
##[ 13  9  5  1 ]
##[ 14  10  6  2 ]
##[ 15  11  7  3 ]
##[ 16  12  8  4 ]
