require('../../test_helper');
describe(LinkedList, function () {
  describe('LinkedList deleteDuplicatesA', function () {

  it('returns 0 length list if 0 length list', function () {
      var l = new SinglyLinkedList();
      LinkedList.deleteDuplicatesA(l);

      expect(l.head).to.be.undefined;
    });
    
    it('returns 1 length list if 1 length list', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      LinkedList.deleteDuplicatesA(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.undefined;
    });

    it('returns 1 length list if 2 length list with dups', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("foo"));
      LinkedList.deleteDuplicatesA(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.undefined;
    });
    
    it('returns 2 length list if 3 length list with dups', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("bar"));
      LinkedList.deleteDuplicatesA(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.not.null;
      expect(l.head.next.next).to.be.undefined;
    });
    
  });
describe('LinkedList deleteDuplicatesB', function () {

  it('returns 0 length list if 0 length list', function () {
      var l = new SinglyLinkedList();
      LinkedList.deleteDuplicatesB(l);

      expect(l.head).to.be.undefined;
    });
    
    it('returns 1 length list if 1 length list', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      LinkedList.deleteDuplicatesB(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.undefined;
    });

    it('returns 1 length list if 2 length list with dups', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("foo"));
      LinkedList.deleteDuplicatesB(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.undefined;
    });
    
    it('returns 2 length list if 3 length list with dups', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("bar"));
      LinkedList.deleteDuplicatesB(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.not.null;
      expect(l.head.next.next).to.be.undefined;
    });
    
  });
});
