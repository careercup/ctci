require_relative '../../spec_helper'
describe Strings do
  context "#is_string_unique?" do
    let(:unique_string_1) { "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" }
    let(:unique_string_2) { "ABCgDEFG" }
    let(:non_unique_string) { "ABCgDEFGG" }
    let(:non_unique_string_long) { "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" }

    it "returns false if string is greater than 128 characters long" do
      expect(Strings.is_string_unique?(non_unique_string_long)).to be_false
    end

    it "returns true if string has unique characters" do
      expect(Strings.is_string_unique?(unique_string_1)).to be_true
      expect(Strings.is_string_unique?(unique_string_2)).to be_true
    end

    it "returns false if string does not have unique characters" do
      expect(Strings.is_string_unique?(non_unique_string)).to be_false
      expect(Strings.is_string_unique?(non_unique_string_long)).to be_false
    end
  end
end
