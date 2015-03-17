class MatrixZeroProcessor(object):

    def __init__(self, matrix):

        self.matrix = matrix
        self.row = []
        self.column = []

    def set_row_and_columns(self):

        [[(self.row.append(rowcount), self.column.append(cellcount)) for cellcount, cell in enumerate(row)
          if cell == 0] for rowcount, row in enumerate(self.matrix)]

        for row in self.row:
            for j in range(len(self.matrix[0])):
                    self.matrix[row][j] = 0


        for col in self.column:
            for i in range(len(self.matrix)):
                self.matrix[i][col] = 0

        return self.matrix

myclass = MatrixZeroProcessor([[0,2,0],[2,0,3]])
matrix = myclass.set_row_and_columns()
print(matrix)
