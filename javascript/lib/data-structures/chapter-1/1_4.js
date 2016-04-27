module.exports = Strings_1_4 = (function() {
  return {
    // Replace spaces to %20 in the given string.
    // @param {String} str
    // @retuns {String} - string with replaced spaces
    replaceSpaces: function(str) {
      var strArr = [],
        strLen = str.length,
        spaceCount = 0,
        newLength,
        i = 0;

      for (;i < strLen; i++) {
        strArr[i] = str.charAt(i);
        
        if (strArr[i] === ' ') {
          spaceCount++;
        } 
      }
      
      newLength = strLen + 2*spaceCount;
      
      for (i = strLen - 1; i >= 0; i--) {
        if (strArr[i] === ' ') {
          strArr[newLength - 1] = '0';
          strArr[newLength - 2] = '2';
          strArr[newLength - 3] = '%';
          newLength = newLength - 3;
        } else {
          strArr[newLength - 1] = str[i];
          newLength = newLength - 1;
        }
      }

      return strArr.join('');
    }
  };
}());
