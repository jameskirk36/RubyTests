class MathParser
  def self.is_addition(s)
    s.include? "a"
  end

  def self.parse(s)
    if is_addition(s)
      lhs = s[0]
      rhs = s[2]
      lhs.to_i + rhs.to_i
    else
      s.to_i
    end
  end
end
