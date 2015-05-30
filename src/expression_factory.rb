require_relative "multiplication_op"
require_relative "addition_op"
require_relative "division_op"
require_relative "subtraction_op"

class ExpressionFactory

  def self.get_supported_operators
    "#{AdditionOp.char}#{SubtractionOp.char}#{MultiplicationOp.char}#{DivisionOp.char}"
  end

  def self.create_expression(operator, lhs, rhs)
    case operator
    when AdditionOp.char
      expr = AdditionOp.new(lhs, rhs)
    when SubtractionOp.char
      expr = SubtractionOp.new(lhs, rhs)
    when MultiplicationOp.char
      expr = MultiplicationOp.new(lhs, rhs)
    when DivisionOp.char
      expr = DivisionOp.new(lhs, rhs)
    end
  end
end
