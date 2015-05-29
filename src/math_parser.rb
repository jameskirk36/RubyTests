require_relative "addition_op"
require_relative "multiplication_op"
require_relative "number_value"

class MathParser
  @@valid_operator_regex = /[#{AdditionOp.get_mapped_value}#{MultiplicationOp.get_mapped_value}]/
  def split(str, op)
    split_pos = str.index(op)
    lhs = str[0..split_pos-1]
    rhs = str[split_pos+1..-1]
    return lhs, rhs
  end

  def find_next_operator(str)
    match = str.match(@@valid_operator_regex)
    if match.nil? == false && match.length > 0 
      split_char = match[0]
    end
  end

  def found_operator?(op)
    op.nil? == false
  end

  def create_expression_for(op, lhs, rhs)
    case op
    when AdditionOp.get_mapped_value
      expr = AdditionOp.new(lhs, rhs)
    when MultiplicationOp.get_mapped_value
      expr = MultiplicationOp.new(lhs, rhs)
    end
  end

  def parse(str)
    expr = parseRecursive(str)
    expr.evaluate unless expr.nil?
  end

  def parseRecursive(str)
    op = find_next_operator(str)
    if found_operator?(op)
      lhs, rhs = split(str, op)
      expr = create_expression_for(op, parseRecursive(lhs), parseRecursive(rhs))
    else
      expr = NumberValue.new(str)
    end
  end
end
