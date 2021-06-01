module Strings
  extend self
    def replace_with_percent (str)
    new_string = "" 
    str.each_char do |c|
      if c == " "
        c.replace "%20"
        new_string = new_string + c
      else
        new_string = new_string + c
      end
    end
    return new_string
  end
end
