module.exports = LinkedList = (function() {
  var deleteDuplicatesA = function(linkedList) {
    if(!linkedList || !linkedList.head) return;
    var values = {};
    var prev = linkedList.head;
    var current = prev;
    values[prev.data] = true;
    while(current.next) {
      var current = prev.next;
      if(values[current.data]) {
        prev.next = current.next;
      } else {
        values[current.data] = true;
      }
    }
  };

  var deleteDuplicatesB = function(linkedList) {
    if(!linkedList || !linkedList.head) return;
    var current = linkedList.head;
    while(current) {
      var runner = current;
      while(runner.next) {
        if(current.data === runner.next.data) {
          runner.next = runner.next.next; // delete the dup
        } else {
          runner = runner.next;
        }
      }
      current = current.next;  
    }
  }

  return {
    deleteDuplicatesA: deleteDuplicatesB,
    deleteDuplicatesB: deleteDuplicatesB
  }
}());
