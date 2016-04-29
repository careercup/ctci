require('../../test_helper');
describe('Strings_1_5', function () {
  describe('compressString', function () {
    it('returns compressed string when it is smaller than original one', function () {
      expect(Strings_1_5.compressString('aabcccccaaa')).to.equal('a2b1c5a3');
    });
    it('returns original string when it is not smaller than original one', function () {
      expect(Strings_1_5.compressString('aabb')).to.equal('aabb');
    });
  });
});
