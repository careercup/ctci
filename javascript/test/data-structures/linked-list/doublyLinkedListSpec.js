require('../../test_helper');
describe('DoublyLinkedList', function () {
  var data = "sweet data",
      list,
      node;
  beforeEach(function () {
    list = new DoublyLinkedList;
    node = new Node(data)
  });
  describe('#head', function(){
    it('is undefined on initialize', function(){
      expect(list.head).to.be.an('undefined');
    });
  });
  describe('#addBottom', function () {
    it('sets head if head is undefined', function () {
      list.addBottom(node)
      expect(list.head).to.eq(node);
    });
    it('adds to the bottom', function () {
      list.addBottom(node);
      var anotherNode = new Node("another node");
      list.addBottom(anotherNode);
      expect(list.head).to.eq(node);
      expect(list.head.next).to.eq(anotherNode);
      expect(list.head.next.prev).to.eq(list.head);
      expect(list.find("another node")).to.eq(anotherNode);
    });
  });

  describe('#find', function () {
    it('returns undefined if no element found', function () {
      expect(list.find("yo")).to.be.an('undefined');
    });
    it('returns the element', function () {
      list.addBottom(node);
      expect(list.find(node.data)).to.eq(node);
    });
  });

  describe('#addTop', function () {
    it('sets head', function () {
      list.addTop(node)
      expect(list.head).to.eq(node);
    });
    it('shifts the list', function () {
      list.addTop(node);
      var anotherNode = new Node("another node");
      list.addTop(anotherNode);
      expect(list.head).to.eq(anotherNode);
      expect(list.head.next).to.eq(node);
    });
  });

  describe('#remove', function () {
    it('removes head if no other elements and head data is eq to data', function () {
      list.addBottom(node);
      list.remove(node.data);
      expect(list.head).to.be.an('undefined');
    });
    it('removes the element if not head', function () {
      list.addBottom(node);
      var anotherNode = new Node("another node");
      list.addBottom(anotherNode);
      list.remove(anotherNode.data);
      expect(list.head).to.be.eq(node);
      expect(list.head.next).to.be.an('undefined');
      expect(list.find(anotherNode.data)).to.be.an('undefined');
      expect(list.find(node.data)).to.be.eq(node);
    });
    it('removes the element and sets prev and next', function () {
      list.addBottom(node);
      var anotherNode = new Node("another node");
      list.addBottom(anotherNode);
      var yetAnotherNode = new Node("yet another node");
      list.addBottom(yetAnotherNode);
      list.remove(anotherNode.data);
      expect(list.head).to.be.eq(node);
      expect(list.head.next).to.eq(yetAnotherNode);
      expect(yetAnotherNode.prev).to.eq(list.head);
      expect(list.find(anotherNode.data)).to.be.an('undefined');
      expect(list.find(node.data)).to.be.eq(node);
    });
  });
});
