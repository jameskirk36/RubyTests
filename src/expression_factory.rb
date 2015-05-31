require_relative "multiplication_op"
require_relative "addition_op"
require_relative "division_op"
require_relative "subtraction_op"

class ExpressionFactory

  def get_supported_operators
    [AdditionOp.char,SubtractionOp.char,MultiplicationOp.char,DivisionOp.char]
  end

  def create_expression(operator, lhs, rhs)
    case operator
    when AdditionOp.char
      AdditionOp.new(lhs, rhs)
    when SubtractionOp.char
      SubtractionOp.new(lhs, rhs)
    when MultiplicationOp.char
      MultiplicationOp.new(lhs, rhs)
    when DivisionOp.char
      DivisionOp.new(lhs, rhs)
    end
  end
  def create_number_value(num)
    NumberValue.new(num)
  end
end
