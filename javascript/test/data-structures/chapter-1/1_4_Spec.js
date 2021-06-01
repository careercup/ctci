require('../../test_helper');
describe(Strings_1_4, function () {
  describe('replaceSpaces', function () {
    it('knows how to replace spaces', function () {
      expect(Strings_1_4.replaceSpaces(' abcdef  gh  ')).to.equal('%20abcdef%20%20gh%20%20');
    });
  });
});
