module Strings
  extend self

  # Example Usage
  # is_string_unique?("ABCDEFG") == true
  # is_string_unique?("ABCgDEFG") == true
  # is_string_unique?("ABCgDEFGG") == false

  def is_string_unique?(str)
    # If the string doesn't meet the minimum requirements
    return false if str.length > 128

    # Store the keys in our hash
    chars = {}
    str.each_byte do |s|
      # Break out as early as we can
      return false if chars.has_key? s
      chars[s] = true
    end

    true
  end

end
