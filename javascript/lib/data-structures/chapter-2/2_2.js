module.exports = LinkedList_2_2 = (function() {
  /* 
   * Return the kth element from the end
   * Make a stack of pointers to each linked list element
   * return the stack.length - (k+1)  element
   * 
   * This uses O(n) space for a stack and takes O(n) time
   * By definition, the space consumed must be less than the linked list because
   * each stack item does not have the linked list data reference.
   */
  var findKthElementFromEnd4 = function(linkedList, index) {
    if(!linkedList || !linkedList.head) return null;
    var current = linkedList.head;
    var stack = [];
    while(current) {
       stack.push(current);
       current = current.next;
    }
    if(stack.length <= index) return null;
    return stack[stack.length - (index + 1)];
  };

  /* 
   * Return the kth element from the end
   * Solution #2 Recursion with Wrapper Array 
   * recursively return an array of the node and the count
   * until the depth equals index, then just keep return the found array
   * 
   * This uses O(n) space for a stack and takes O(n) time
   */
  var findKthElementFromEnd2C = function(linkedList, index) {
    var returnNodeAndCounterFromEnd = function(node, index){
      if(!node.next){
        return [node, 0];
      }
      // Would be better to figure a call at the end for tail recursion
      var struct = returnNodeAndCounterFromEnd(node.next, index);
      if(struct[1] < index) {
        return [node, struct[1] + 1];
      } else {
        return struct;
      }
    };

    if(!linkedList || !linkedList.head) return null;
    var struct = returnNodeAndCounterFromEnd(linkedList.head, index);
    if(struct[1] === index) {
      return struct[0];
    } else {
      return null;
    }

  };


  return {
    findKthElementFromEnd2C: findKthElementFromEnd2C,
    findKthElementFromEnd4: findKthElementFromEnd4
  }
}());
