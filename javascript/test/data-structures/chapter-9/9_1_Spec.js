require('../../test_helper');
describe('Staircase', function () {
  describe('count', function () {

    it('returns 1 with 1 stair', function () {
      var count = Staircase.count(1);
      expect(count).to.equal(1);
    });

    it('returns 2 with 2 stair', function () {
      var count = Staircase.count(2);
      expect(count).to.equal(2);
    });
    it('returns 4 with 3 stair', function () {
      var count = Staircase.count(3);
      expect(count).to.equal(4);
    });
    it('returns 7 with 4 stair', function () {
      var count = Staircase.count(4);
      expect(count).to.equal(7);
    });
    
    it('returns 3831006429 with 37 stair', function () {
      var count = Staircase.count(37);
      expect(count).to.equal(3831006429);
    });
  });
});
