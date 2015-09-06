module.exports = Strings_1_2 = (function() {
  return {

    // NOT inline option
   //  reverseString: function(str) {
   //    if (str.length === 0) {
   //      return '';
   //    }
   //    return  str[str.length - 1] + arguments.callee(str.substr(0, str.length - 1));
   // }
   //
   //

    /*
     * Reverses a string inline recursively
     * @param {String} str - The string to be reversed
     * @returns {String} The reversed string
     */
    reverseString: function(str) {
      var len = str.length;
      if (len > 1) {
        return str[len - 1] + arguments.callee(str.substring(1, len - 1)) + str[0];
      }
      return str;
    }
  };
}());
