module.exports = Strings_1_5 = (function() {
  return {
    // Compress string.
    // Solution with arrays without string concatenation. Should be theoretically faster.
    // @param {String} str - input string
    // @retuns {String} - compressed string
    compressString: function compressString(str) {
      var compressedStringLength = countCompressedStringLength(str),
          compressedCharArray,
          compressedCharArrayIndex = 0,
          previousSymbol = str[0],
          previousSymbolCount = 1,
          currentSymbol,
          i;

      if (compressedStringLength >= str.length) {
        return str;
      }

      compressedCharArray = new Array(compressedStringLength);

      for (i = 1; i < str.length; i++) {
        currentSymbol = str.charAt(i);

        if (currentSymbol === previousSymbol) {
          previousSymbolCount++;
        } else {
          compressedCharArray[compressedCharArrayIndex++] = previousSymbol;
          compressedCharArray[compressedCharArrayIndex++] = previousSymbolCount;
          previousSymbol = currentSymbol;
          previousSymbolCount = 1;
        }
      }

      compressedCharArray[compressedCharArrayIndex++] = previousSymbol;
      compressedCharArray[compressedCharArrayIndex] = previousSymbolCount;

      return compressedCharArray.join('');

      function countCompressedStringLength(str) {
        if (typeof str === 'undefined' || str === null || str === '') {
          return 0;
        }

        var previousSymbol = str[0],
            previousSymbolCount = 1,
            currentSymbol,
            compressedStringLength = 0,
            i;

        for (i = 1; i < str.length; i++) {
          currentSymbol = str.charAt(i);

          if (currentSymbol === previousSymbol) {
            previousSymbolCount++;
          } else {
            compressedStringLength += (1 + previousSymbolCount.toString().length);
            previousSymbol = currentSymbol;
            previousSymbolCount = 1;
          }
        }

        compressedStringLength += (1 + previousSymbolCount.toString().length);

        return compressedStringLength;
      }
    }
  };
}());
