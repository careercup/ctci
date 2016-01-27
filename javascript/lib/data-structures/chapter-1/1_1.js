module.exports = UniqueChars = function () {
    return {
        isUniqueChars2: function (str) {
            if (str.length > 128) {
                return false;
            }

            var char_set = {};
            for (var i = 0; i < str.length; i++) {
                var val = str[i];
                if (char_set[val]) return false;
                char_set[val] = true;
            }
            return true;
        },

        isUniqueChars: function (str) {
            if (str.length > 128) {
                return false;
            }
            var checker = 0;
            for (var i = 0; i < str.length; i++) {
                var val = str.charCodeAt(i) - 'a'.charCodeAt(0);
                if ((checker & (1 << val)) > 0) return false;
                checker |= (1 << val);
            }
            return true;
        }
    }
}();