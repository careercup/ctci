require_relative '../../spec_helper'

describe Strings do
  context "#is_anagram?" do

    it "returns false if the length is different" do
      expect(Strings.is_anagram?('aa','aaa')).to be_false
    end

    it "returns false if upper - lower case matters" do
      expect(Strings.is_anagram?('A','a')).to be_false
    end

    it "returns true if both strings have the same characters any order" do
      expect(Strings.is_anagram?('Ab','bA')).to be_true
    end
  end
end
