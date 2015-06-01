require_relative "utils/string_utils"

class ExpressionEvaluator

  def initialize(expression_factory)
    @expression_factory = expression_factory
  end

  def set_mappings(mappings)
    supported_mappings = @expression_factory.get_supported_operators.map { |op| mappings.key(op) }
    @mappings = mappings
    @valid_operator_regex = /[#{Regexp.escape(supported_mappings.join)}]/
  end

  def build_expression_tree_from(expr)
    index = StringUtils.find_last_index(expr, @valid_operator_regex)
    if valid_index?(index)
      lhs, rhs = StringUtils.split_string_at(expr, index)
      operator = extract_operator_from(expr, index)
      @expression_factory.create_expression(operator, build_expression_tree_from(lhs), build_expression_tree_from(rhs))
    else
      @expression_factory.create_number_value(expr.to_i)
    end
  end

  private

  def valid_index?(index)
    index.nil? == false
  end

  def extract_operator_from(expr, index)
    @mappings[expr[index]]
  end
end
