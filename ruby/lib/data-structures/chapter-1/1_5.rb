module Strings
  extend self

  #
  # Example usage
  #
  # compress_string("aaabbbcccaadee")
  # compress_string("abbbcccaadee") == "a1b3c3a2d1e2"
  # compress_string("aaabbbcccaade") == "a3b3c3a2d1e1"

  # Helper function for adding a count to our string
  def add_character_with_count(last_char, char_count)
    last_char + char_count.to_s
  end

  def compress_string(str)

    return "" if str.nil? || str == ""
    return str if str.length < 2

    # Store the variables
    char_count = 1
    last_char = str[0]
    result = []

    # Loop through the characters of our string that aren't the first character.
    str.slice(1..-1).each_byte do |i|
      # Fixnum#chr converts any number to the ASCII char it represents
      char = i.chr

      # If it's the same character, just up the count
      if char == last_char
        char_count += 1
      else
        # If it's a different character add it to our results array
        result << add_character_with_count(last_char, char_count)
        char_count = 1
      end

      # Update our character reference ;)
      last_char = char
    end

    # Account for the last character
    result << add_character_with_count(last_char, char_count)

    # Return the joined array.
    result.join("")
  end


end
