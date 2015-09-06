require('../../test_helper');
describe(Strings_1_2, function () {
  describe('is', function () {
    var str1, str2;
    beforeEach(function () {
      str1 = "hello";
      str2 = "olleh";
      str3 = "abcdefa";
      str3 = "abcdefa";
    });
    it('returns the reverse of hello', function () {
      expect(Strings_1_2.reverseString(str1)).to.equal(str2);
    });
  });
});
