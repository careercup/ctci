module.exports = Strings_1_1 = (function() {
  var _isSubstring = function(str1, str2) {
    return str1.indexOf(str2) != -1
  }
  var _sameLengthAndNotBlank = function(str1, str2) {
    var len = str1.length;
    return len === str2.length && len > 0
  }
  return {
    isUnique: function(str1) {
      return true;
      // if(!_sameLengthAndNotBlank(str1, str2)) return false;
      // if(_isSubstring(str1+str1, str2)) return true;
    }
  }
}());
