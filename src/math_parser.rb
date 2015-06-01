require_relative "expression_factory"
require_relative "expression_evaluator"
require_relative "bracket_evaluator"
require_relative "utils/string_utils"

class MathParser

  def initialize
    @expression_evaluator = ExpressionEvaluator.new(ExpressionFactory.new)
    @bracket_evaluator = BracketEvaluator.new(@expression_evaluator)
  end

  def setup_mappings(mappings)
    @expression_evaluator.set_mappings(mappings)
    @bracket_evaluator.set_bracket_chars(mappings.key("("), mappings.key(")"))
  end

  def evaluate(expr)
    expr = @bracket_evaluator.recursive_bracket_evaluation(expr)

    expr_tree = @expression_evaluator.build_expression_tree_from(expr)
    expr_tree.evaluate unless expr_tree.nil?
  end

end
