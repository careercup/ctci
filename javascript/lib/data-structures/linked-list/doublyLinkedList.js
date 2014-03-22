var Node = require('./node');

module.exports = DoublyLinkedList = function(){}

DoublyLinkedList.prototype = {
  addBottom: function(node) {
    if (this.head == undefined) return this.head = node;
    var currentNode = this.head;
    while(currentNode.next !== undefined) {
      currentNode = currentNode.next;
    }
    currentNode.next = node;
    node.prev = currentNode;
  },

  find: function(data) {
    var currentNode = this.head;
    while(currentNode !== undefined) {
      if(currentNode.data == data) return currentNode;
      currentNode = currentNode.next;
    }
  },

  addTop: function(node) {
    if (this.head == undefined) return this.head = node;
    node.next = this.head;
    this.head = node;
  },

  remove: function(data) {
    if (this.head.data == data) return this.head = this.head.next;
    var node = this.find(data);
    if (node === undefined) return;
    if(node.next !== undefined) node.next.prev = node.prev;
    node.prev.next = node.next;
    node.prev = node.next = undefined;

  }
}

