require_relative "addition_op"
require_relative "multiplication_op"
require_relative "number_value"

class MathParser
  @@valid_operator_regex = /[#{AdditionOp.char}#{MultiplicationOp.char}]/

  def initialize(expression_factory)
    @expression_factory = expression_factory
  end

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

  def parse(str)
    expr = recursive_parse(str)
    expr.evaluate unless expr.nil?
  end

  def recursive_parse(str)
    index = find_next_operator_index(str)
    if valid_index?(index)
      lhs, rhs = split_string_at(str, index)
      operator = extract_operator_from(str, index)
      expr = @expression_factory.create_expression(operator, recursive_parse(lhs), recursive_parse(rhs))
    else
      expr = NumberValue.new(str.to_i)
    end
  end
end
