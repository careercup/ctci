module.exports = MyQueue = (function(){

  function MyQueue() {
    if (!(this instanceof MyQueue)) {
      return new MyQueue;
    }
    this.oldest = [];
    this.newest = [];
  };

  function shiftStacks() {
    if(this.oldest.length == 0) {
      while(this.newest.length > 0) {
        this.oldest.push(this.newest.pop());
      }
    }
  };

  MyQueue.prototype.push = function(item) {
    this.newest.push(item);
  };

  MyQueue.prototype.pop = function() {
    shiftStacks.call(this);
    return this.oldest.pop();
  };

  return MyQueue;
})();