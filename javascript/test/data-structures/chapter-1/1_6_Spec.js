require('../../test_helper');
describe('Strings_1_6', function () {
  describe('rotate', function () {
    it('rotates two-dimensional array by 90 degrees', function () {
      var grid = [
        [1,2,3,4],
        [5,6,7,8],
        [9,10,11,12],
        [13,14,15,16]
      ];

      Strings_1_6.rotate(grid);

      expect(grid).to.deep.equal([
        [13,9,5,1],
        [14,10,6,2],
        [15,11,7,3],
        [16,12,8,4]
      ]);
    });
  });
});
