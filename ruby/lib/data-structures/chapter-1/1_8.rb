module Strings
  extend self
  def rotation? str1, str2
    return false if str1.length != str2.length || str1.length.zero?
    "#{str1}#{str1}".include?(str2)
  end
end
