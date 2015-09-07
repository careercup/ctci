require('../../test_helper');
describe(Strings_1_2, function () {
  describe('reverseString', function () {
    var str1, str2;
    beforeEach(function () {
      str1 = 'hello';
      str2 = 'olleh';
      str3 = 'abcdef';
      str4 = 'aedcbb';
    });
    it('returns the reverse of hello', function () {
      expect(Strings_1_2.reverseString(str1)).to.equal(str2);
    });
    it('returns the reverse of hello', function () {
      expect(Strings_1_2.reverseString(str3)).not.to.equal(str4);
    });
  });
});
