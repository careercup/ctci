module Strings
  extend self

  # Example usage
  #
  # is_anagram? "abc", "bca" # => true
  # is_anagram? "abc", "Bca" # => false
  # is_anagram? "aaa", "aa"  # => false

  # Assuming a string made of ASCII characters,
  # counts how many times appears each character and returns
  # the count as an array.
  def count(str)
    str.chars.inject(Array.new 256,0) do |alphabet,char| 
      alphabet[char.ord] += 1
      alphabet
    end
  end

  def is_anagram?(a = '', b = '')
    # return early if the length is different
    return false unless a.length == b.length
    # Compares if each character appears the same number of times in both strings
    count(a) == count(b)
  end
end
