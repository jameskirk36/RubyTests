class StringUtils
  def self.split_string_at(str, pos)
    lhs = str[0..pos-1]
    rhs = str[pos+1..-1]
    return lhs, rhs
  end

  def self.replace_string_in_string(str, replace_this, with_this)
    str.gsub(replace_this, with_this)
  end

  def self.find_last_index(str, regex)
    str.rindex(regex)
  end
end
