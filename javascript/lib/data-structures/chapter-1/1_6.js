module.exports = Strings_1_6 = (function() {
  return {
    /**
     * Rotate grid by 90 degrees. Grid is assumed to be NxN size.
     * @param {Number[][]} grid - two-dimensional array of size NxN
     */
    rotate: function rotate(grid) {
      var N = grid.length,
          layer,
          i,
          offset,
          first,
          last,
          top;

      for (layer = 0; layer < Math.floor(N / 2); ++layer) {
        first = layer;
        last = N - 1 - layer;

        for(i = first; i < last; ++i) {
          offset = i - first;
          
          top = grid[first][i]; // save top

          // left -> top
          grid[first][i] = grid[last-offset][first];

          // bottom -> left
          grid[last-offset][first] = grid[last][last - offset];

          // right -> bottom
          grid[last][last - offset] = grid[i][last];

          // top -> right
          grid[i][last] = top; // right <- saved top
        }
      }
    }
  };
}());
