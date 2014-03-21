require('../../test_helper')
describe('Node', function () {
  var data = "sweet data",
      node;
  beforeEach(function () {
    node = new Node(data);
  });
  describe('#data', function () {
    it('is initialized to the passed in value', function () {
      expect(node.data).to.eq(data);
    });
    it('raises if data is undefined', function () {
      expect(function() { new Node }).to.throw(Error);
    });
    it('we are able to set it', function () {
      var anoterData = "another data";
      node.data = anoterData;
      expect(node.data).to.eq(anoterData);
    });
  });
  describe('#next', function () {
    it('is initialized to nil', function () {
      expect(node.next).be.an('undefined');
    });
  });
  describe('#prev', function () {
    it('is initialized to nil', function () {
      expect(node.prev).be.an('undefined');
    });
  });
});
