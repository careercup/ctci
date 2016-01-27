describe('Permutations', function () {
    it('returns true if letters are the same', function () {
        expect(Permutations.isPermutation('dog', 'god')).to.be.true;
        expect(Permutations.isAnagram('dog', 'god')).to.be.true;
    });

    it('returns false becase space is significant', function () {
        expect(Permutations.isPermutation('dog', 'god ')).to.be.false;
        expect(Permutations.isAnagram('dog', 'god ')).to.be.false;
    });

    it('returns false if string have different length', function () {
        expect(Permutations.isPermutation('adog', 'god ')).to.be.false;
        expect(Permutations.isAnagram('adog', 'god ')).to.be.false;
    });

    it('returns false if letters of different case', function () {
        // our algorithm is case-sensitive
        expect(Permutations.isPermutation('Dog', 'god')).to.be.false;
        expect(Permutations.isAnagram('Dog', 'god')).to.be.false;
    });
});