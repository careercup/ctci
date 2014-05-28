module.exports = Staircase = (function(){
  var memo = [];

  /*
   * Chapter 9 question 1
   * A child is running up a staircase with n steps, and can hop either 1 step, 
   * 2 steps, or 3 steps at a time. Implement a method to count how many possible 
   * ways the child can run up the stairs.
   */
  var count = function(n) {
    return countWays(n, 0);
  };

  var countWays = function(remaining){
    if(remaining < 0) {
      return 0;    
    } 
    if(remaining == 0) {
      return 1;
    }
    if(memo[remaining]) {
      return memo[remaining];
    }
    else {
      memo[remaining] = countWays(remaining-1)
       + countWays(remaining-2)
        + countWays(remaining-3);
      return memo[remaining];
    }
  };
    
  return {
    count: count
  };
})();