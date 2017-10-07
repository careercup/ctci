require('../../test_helper');
describe(Strings_1_3, function () {
  describe('isPermutation', function () {
    var str1, str2;
    beforeEach(function () {
      str1 = 'hello';
      str2 = 'olleh';
      str3 = 'abcdef';
    });
    it('knows reversed strings are permutations', function () {
      expect(Strings_1_3.isPermutation(str1, str2)).to.be.true;
    });
    it('knows unrelated strings are not permutations', function () {
      expect(Strings_1_3.isPermutation(str1, str3)).to.be.false;
    });
  });
});
