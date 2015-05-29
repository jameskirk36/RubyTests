require_relative "addition_op"

class MathParser

  def self.extract_lhs(s)
    s[0]
  end

  def self.extract_rhs(s)
    s[2]
  end

  def self.parse(s)
    if AdditionOp.is_addition(s)
      lhs = extract_lhs(s)
      rhs = extract_rhs(s)
      op = AdditionOp.new(lhs, rhs)
      op.evaluate
    else
      s.to_i
    end
  end
end
