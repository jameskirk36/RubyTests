require_relative "addition_op"
require_relative "multiplication_op"
require_relative "number_value"

class MathParser
  @@valid_operator_regex = /[#{AdditionOp.get_mapped_value}#{MultiplicationOp.get_mapped_value}]/
  def split_string_at(str, pos)
    lhs = str[0..pos-1]
    rhs = str[pos+1..-1]
    return lhs, rhs
  end

  def find_next_operator_index(str)
    str.rindex(@@valid_operator_regex)
  end

  def valid_index?(index)
    index.nil? == false
  end

  def extract_operator_from(str, index)
    str[index]
  end

  def create_expression_tree(op, lhs, rhs)
    case op
    when AdditionOp.get_mapped_value
      expr = AdditionOp.new(lhs, rhs)
    when MultiplicationOp.get_mapped_value
      expr = MultiplicationOp.new(lhs, rhs)
    end
  end

  def parse(str)
    expr = recursive_parse(str)
    expr.evaluate unless expr.nil?
  end

  def recursive_parse(str)
    index = find_next_operator_index(str)
    if valid_index?(index)
      lhs, rhs = split_string_at(str, index)
      operator = extract_operator_from(str, index)
      expr = create_expression_tree(operator, recursive_parse(lhs), recursive_parse(rhs))
    else
      expr = NumberValue.new(str)
    end
  end
end
