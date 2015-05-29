require_relative "addition_op"
require_relative "number_value"

class MathParser

  def self.extract_lhs(str, i)
    str[0..i-1]
  end

  def self.extract_rhs(str, i)
    str[i+1..-1]
  end

  def self.parse(str)
    match = str.match(/[a]/)
    if match.nil? == false && match.length > 0 
      split_char = match[0]
      split_pos = str.index(split_char)
      if AdditionOp.is_addition(split_char)
        lhs = extract_lhs(str, split_pos)
        rhs = extract_rhs(str, split_pos)
        expr = AdditionOp.new(lhs, rhs)
      end
    else
      expr = NumberValue.new(str)
    end

    expr.evaluate unless expr.nil?
  end
end
