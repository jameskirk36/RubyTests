require_relative "addition_op"
require_relative "multiplication_op"
require_relative "number_value"

class MathParser
  @valid_operator_regex = /[#{AdditionOp.get_mapped_value}#{MultiplicationOp.get_mapped_value}]/

  def self.extract_lhs(str, split_pos)
    str[0..split_pos-1]
  end

  def self.extract_rhs(str, split_pos)
    str[split_pos+1..-1]
  end

  def self.find_next_operator(str)
    match = str.match(@valid_operator_regex)
    if match.nil? == false && match.length > 0 
      split_char = match[0]
    end
  end

  def self.get_operator_position(op, str)
    str.index(op)
  end

  def self.found_operator?(op)
    op.nil? == false
  end

  def self.create_expression_for(op, lhs, rhs)
    case op
    when AdditionOp.get_mapped_value
      expr = AdditionOp.new(lhs, rhs)
    when MultiplicationOp.get_mapped_value
      expr = MultiplicationOp.new(lhs, rhs)
    end
  end

  def self.parse(str)
    op = find_next_operator(str)
    if found_operator?(op)
      op_position = get_operator_position(op, str)

      lhs = extract_lhs(str, op_position)
      rhs = extract_rhs(str, op_position)

      expr = create_expression_for(op, lhs, rhs)
    else
      expr = NumberValue.new(str)
    end

    expr.evaluate unless expr.nil?
  end
end
