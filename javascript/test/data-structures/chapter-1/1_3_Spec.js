require('../../test_helper');
describe(Strings_1_3, function () {
  describe('isPermutation', function () {
    var str1, str2;
    beforeEach(function () {
      str1 = 'hello';
      str2 = 'olleh';
      str3 = 'abcdef';
      str4 = 'aedcbb';
    });
    it('returns the reverse of hello', function () {
      expect(Strings_1_3.isPermutation(str1, str2)).to.be.true;
    });
  });
});
