require_relative "multiplication_op"
require_relative "addition_op"

class ExpressionFactory

  def self.get_supported_operators
    "#{AdditionOp.char}#{MultiplicationOp.char}"
  end

  def self.create_expression(operator, lhs, rhs)
    case operator
    when AdditionOp.char
      expr = AdditionOp.new(lhs, rhs)
    when MultiplicationOp.char
      expr = MultiplicationOp.new(lhs, rhs)
    end
  end
end
