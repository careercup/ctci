#Write an algorithm such that if an element in an MxN matrixis 0, its entire row
#and column are set to 0.

class MatrixProcessor:

    def __init__(self, matrix):
        self.n=len(matrix)
        self.m=len(matrix[0])
        self.matrix = matrix

    def __str__(self):
        rowstring=""
        for row in self.matrix:
            rowstring = rowstring + "["
            for cell in row:
                rowstring = rowstring + " " + str(cell) + " "
            rowstring = rowstring + "]\n"            
        return rowstring

    def zeroProcess(self):
        columnstozero=[]
        rowstozero=[]
        for rowcount,row in enumerate(self.matrix):
            for cellcount, cell in enumerate(row):
                if cell == 0:
                    columnstozero.append(cellcount)
                    rowstozero.append(rowcount)
        for rownum in rowstozero:
            self.zeroRow(rownum)
        for colnum in columnstozero:
            self.zeroColumn(colnum)

    def zeroRow(self, rownum):
        newRow=[]
        for x in range(0, self.m):
            newRow.append(0)
        self.matrix[rownum]=newRow

    def zeroColumn(self, colnum):
        for row in self.matrix:
            row[colnum]=0
                    
#testing
        
mat1= MatrixProcessor([[1,2,3],[4,5,0],[7,8,9],[0,11,12]])

print "M by N matrix has dimensions " + str(mat1.m) + " by " + str(mat1.n)

print "Visual representation of contents:"
print str(mat1)                  


mat1.zeroProcess()

print "Visual representation of contents after zeroing all rows/columns containing a zero:"
print str(mat1)                  


#sample output

##M by N matrix has dimensions 3 by 4
##Visual representation of contents:
##[ 1  2  3 ]
##[ 4  5  0 ]
##[ 7  8  9 ]
##[ 0  11  12 ]
##
##Visual representation of contents after zeroing all rows/columns containing a zero:
##[ 0  2  0 ]
##[ 0  0  0 ]
##[ 0  8  0 ]
##[ 0  0  0 ]
