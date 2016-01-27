module.exports = Permutations = function () {
    return {
        isPermutation: function (str1, str2) {
            if (str1.length !== str2.length) return false;

            return str1.split('').sort().join('') === str2.split('').sort().join('');
        },

        isAnagram: function (s, t) {
            if (s.length != t.length) return false;

            var letters = {};
            var num_unique_chars = 0;
            var num_completed_t = 0;
            var i, c;

            for (i = 0; i < s.length; i++) { // count number of each char in s.
                c = s[i];
                if (!letters[c]) {
                    ++num_unique_chars;
                    letters[c] = 0;
                }
                ++letters[c];
            }

            for (i = 0; i < t.length; ++i) {
                c = t[i];
                if (!letters[c]) { // Found more of char c in t than in s.
                    return false;
                }
                --letters[c];
                if (letters[c] == 0) {
                    ++num_completed_t;
                    if (num_completed_t == num_unique_chars) {
                        // it�s a match if t has been processed completely
                        return true;
                        //return i == t.length() - 1;
                    }
                }
            }
            return false;
        }
    }
}();