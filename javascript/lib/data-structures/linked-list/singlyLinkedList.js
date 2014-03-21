var Node = require('./node');

module.exports = SinglyLinkedList = function(){}

SinglyLinkedList.prototype = {
  addBottom: function(node) {
    if (this.head == undefined) return this.head = node;
    var currentNode = this.head;
    while(currentNode.next !== undefined) {
      currentNode = currentNode.next;
    }
    currentNode.next = node;
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
    var prevNode = this.head;
    var currentNode = this.head.next;
    while(currentNode !== undefined) {
      if(currentNode.data == data) {
        prevNode.next = currentNode.next;
        return currentNode.next = undefined;
      }
      prevNode = currentNode;
      currentNode = currentNode.next;
    }
  }
}

