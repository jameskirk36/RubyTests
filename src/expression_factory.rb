class ExpressionFactory
  def create_expression(operator, lhs, rhs)
    case operator
    when AdditionOp.char
      expr = AdditionOp.new(lhs, rhs)
    when MultiplicationOp.char
      expr = MultiplicationOp.new(lhs, rhs)
    end
  end
end
