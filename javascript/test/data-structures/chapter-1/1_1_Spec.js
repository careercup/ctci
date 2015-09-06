require('../../test_helper');
describe(Strings_1_1, function () {
  describe('hasUniqueChars', function () {
    var str1, str2;
    beforeEach(function () {
      str1 = "abcdef";
      str2 = "aabcdef";
      str3 = "abcdefa";
    });
    it('returns true if string is all unique chars', function () {
      expect(Strings_1_1.isUnique(str1)).to.be.false
    });
    // it('returns false if str1 is blank', function () {
    //   expect(Strings_1_1.isUnique("", "")).to.be.false
    // });
    // it('returns true if str2 is rotation of str1', function () {
    //   expect(Strings_1_1.isUnique(str1, str2)).to.be.true
    // });
  });
});
