require('../../test_helper');
describe(LinkedList, function () {
  describe('LinkedList findKthElementFromEnd #2C (recursion returning array of node and counter)', function () {

  it('returns null if 0 length list', function () {
      var l = new SinglyLinkedList();
      var item = LinkedList.findKthElementFromEnd2C(l, 1);
      expect(item).to.be.null;
    });
    
    it('returns null if k >= list length', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      var item = LinkedList.findKthElementFromEnd2C(l, 1);
      expect(item).to.be.null;
    });

    it('returns 1st item in 1 length list k == 0', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      var item = LinkedList.findKthElementFromEnd2C(l, 0);
      expect(item).to.be.not.null;
      expect(item.data).to.equal("foo");
    });


    it('returns 1st item in 2 length list k == 0', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("bar"));
      var item = LinkedList.findKthElementFromEnd2C(l, 0);
      expect(item).to.be.not.null;
      expect(item.data).to.equal("bar");
    });
    
    it('returns 2nd item in 2 length list k == 1', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("bar"));
      var item = LinkedList.findKthElementFromEnd2C(l, 1);
      expect(item).to.be.not.null;
      expect(item.data).to.equal("foo");
    });
    
  });

describe('LinkedList findKthElementFromEnd #4 (stack of pointers to linked list items)', function () {

  it('returns null if 0 length list', function () {
      var l = new SinglyLinkedList();
      var item = LinkedList.findKthElementFromEnd4(l, 1);
      expect(item).to.be.null;
    });
    
    it('returns null if k >= list length', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      var item = LinkedList.findKthElementFromEnd4(l, 1);
      expect(item).to.be.null;
    });

    it('returns 1st item in 1 length list k == 0', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      var item = LinkedList.findKthElementFromEnd4(l, 0);
      expect(item).to.be.not.null;
      expect(item.data).to.equal("foo");
    });


    it('returns 1st item in 2 length list k == 0', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("bar"));
      var item = LinkedList.findKthElementFromEnd4(l, 0);
      expect(item).to.be.not.null;
      expect(item.data).to.equal("bar");
    });
    
    it('returns 2nd item in 2 length list k == 1', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("bar"));
      var item = LinkedList.findKthElementFromEnd4(l, 1);
      expect(item).to.be.not.null;
      expect(item.data).to.equal("foo");
    });
    
  });

});
