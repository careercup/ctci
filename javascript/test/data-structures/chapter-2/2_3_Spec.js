require('../../test_helper');
describe(LinkedList_2_3, function () {
  describe('deleteNode)', function () {

  it('runs if 0 length list', function () {
      var l = new SinglyLinkedList();
      LinkedList_2_3.deleteNode(l, new Node("foo"));
      expect(l).to.be.not.null;
    });
    

    it('deletes 1st item in 2 length list', function () {
      var l = new SinglyLinkedList();
      var n = new Node("foo");
      l.addBottom(n);
      l.addBottom(new Node("bar"));
      LinkedList_2_3.deleteNode(n);
      expect(l.head).to.equal(n);
      expect(l.head.data).to.equal("bar");
    });

    it('returns 3rd item in 5 length list', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("a"));
      l.addBottom(new Node("b"));
      var n = new Node("c");
      l.addBottom(n);
      l.addBottom(new Node("d"));
      l.addBottom(new Node("e"));
      
      LinkedList_2_3.deleteNode(n);
      expect(l.head).to.be.not.null;
      expect(l.head.data).to.equal("a");
      expect(l.head.next.data).to.equal("b");
      expect(l.head.next.next.data).to.equal("d");
      expect(l.head.next.next.next.data).to.equal("e");
    });
  });
});
