require_relative "addition_op"
require_relative "number_value"

class MathParser

  def self.extract_lhs(expr)
    expr[0]
  end

  def self.extract_rhs(expr)
    expr[2]
  end

  def self.parse(expr)
    lhs = extract_lhs(expr)
    rhs = extract_rhs(expr)
    if AdditionOp.is_addition(expr)
      op = AdditionOp.new(lhs, rhs)
    else
      op = NumberValue.new(expr)
    end
    op.evaluate
  end
end
