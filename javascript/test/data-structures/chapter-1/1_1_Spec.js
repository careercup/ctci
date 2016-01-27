describe('Unique Chars', function () {


    it('returns true on empty string', function () {
        expect(UniqueChars.isUniqueChars2("")).to.be.true;
    });

    it('returns false on long string', function () {
        var str = [];
        for (var i = 0; i < 256; i++) {
            str.push(String.fromCharCode(i));
        }
        str = str.join('');
        expect(UniqueChars.isUniqueChars2(str)).to.be.false;
        expect(UniqueChars.isUniqueChars(str)).to.be.false;
    });

    it('returns true if unique chars', function () {
        var str = "abcde";
        expect(UniqueChars.isUniqueChars2(str)).to.be.true;
        expect(UniqueChars.isUniqueChars(str)).to.be.true;
    });

    it('returns false if there are duplicates', function () {
        var str = "hello";
        expect(UniqueChars.isUniqueChars2(str)).to.be.false;
        expect(UniqueChars.isUniqueChars(str)).to.be.false;
    });

});