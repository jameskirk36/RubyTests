require_relative "expression_factory"
require_relative "bracket_extractor"
require_relative "string_utils"

class MathParser
  def initialize
    @bracket_extractor = BracketExtractor.new
    @expression_factory = ExpressionFactory.new
  end

  def setup_mappings(mappings)
    @mappings = mappings
    mapped_operators = @expression_factory.get_supported_operators.map { |op| mappings.key(op) }
    @valid_operator_regex = /[#{Regexp.escape(mapped_operators.join)}]/
    @bracket_extractor.set_bracket_chars(mappings.key("("), mappings.key(")"))
  end

  def evaluate(expr)
    expr = recursive_bracket_evaluation(expr)

    expr_tree = build_expression_tree_from(expr)
    expr_tree.evaluate unless expr_tree.nil?
  end

  def recursive_bracket_evaluation(expr)
    if @bracket_extractor.has_brackets?(expr)
      section = @bracket_extractor.extract_innermost_bracket_section_from(expr)
      tree = build_expression_tree_from(@bracket_extractor.remove_brackets(section))
      expr = StringUtils.replace_string_in_string(expr, section, tree.evaluate.to_s)
      recursive_bracket_evaluation(expr) 
    else
      expr
    end
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

  def valid_index?(index)
    index.nil? == false
  end

  def extract_operator_from(expr, index)
    @mappings[expr[index]]
  end
end
