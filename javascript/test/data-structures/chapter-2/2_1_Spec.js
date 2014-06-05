require('../../test_helper');
describe(LinkedList_2_1, function () {
  describe('LinkedList_2_1 deleteDuplicatesA', function () {

  it('returns 0 length list if 0 length list', function () {
      var l = new SinglyLinkedList();
      LinkedList_2_1.deleteDuplicatesA(l);

      expect(l.head).to.be.undefined;
    });
    
    it('returns 1 length list if 1 length list', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      LinkedList_2_1.deleteDuplicatesA(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.undefined;
    });

    it('returns 1 length list if 2 length list with dups', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("foo"));
      LinkedList_2_1.deleteDuplicatesA(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.undefined;
    });
    
    it('returns 2 length list if 3 length list with dups', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("bar"));
      LinkedList_2_1.deleteDuplicatesA(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.not.null;
      expect(l.head.next.next).to.be.undefined;
    });
    
  });
describe('LinkedList_2_1 deleteDuplicatesB', function () {

  it('returns 0 length list if 0 length list', function () {
      var l = new SinglyLinkedList();
      LinkedList_2_1.deleteDuplicatesB(l);

      expect(l.head).to.be.undefined;
    });
    
    it('returns 1 length list if 1 length list', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      LinkedList_2_1.deleteDuplicatesB(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.undefined;
    });

    it('returns 1 length list if 2 length list with dups', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("foo"));
      LinkedList_2_1.deleteDuplicatesB(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.undefined;
    });
    
    it('returns 2 length list if 3 length list with dups', function () {
      var l = new SinglyLinkedList();
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("foo"));
      l.addBottom(new Node("bar"));
      LinkedList_2_1.deleteDuplicatesB(l);

      expect(l.head).to.be.not.null;
      expect(l.head.next).to.be.not.null;
      expect(l.head.next.next).to.be.undefined;
    });
    
  });
});
