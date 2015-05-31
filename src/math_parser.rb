require_relative "expression_factory"
require_relative "bracket_extractor"

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

  def split_string_at(expr, pos)
    lhs = expr[0..pos-1]
    rhs = expr[pos+1..-1]
    return lhs, rhs
  end

  def find_next_operator_index(expr)
    expr.rindex(@valid_operator_regex)
  end

  def valid_index?(index)
    index.nil? == false
  end

  def extract_operator_from(expr, index)
    @mappings[expr[index]]
  end

  def remove_brackets(bracket_section)
    bracket_section[1..bracket_section.length-2]
  end

  def replace_section_with_evaluated_form(section, tree, expr)
    expr.gsub(section, tree.evaluate.to_s)
  end


  def recursive_bracket_evaluation(expr)
    if @bracket_extractor.has_brackets?(expr)
      section = @bracket_extractor.extract_innermost_bracket_section_from(expr)
      tree = build_expression_tree_from(remove_brackets(section))
      expr = replace_section_with_evaluated_form(section, tree, expr)
      recursive_bracket_evaluation(expr) 
    else
      expr
    end
  end

  def evaluate(expr)
    expr = recursive_bracket_evaluation(expr)

    expr_tree = build_expression_tree_from(expr)
    expr_tree.evaluate unless expr_tree.nil?
  end

  def build_expression_tree_from(expr)
    index = find_next_operator_index(expr)
    if valid_index?(index)
      lhs, rhs = split_string_at(expr, index)
      operator = extract_operator_from(expr, index)
      @expression_factory.create_expression(operator, build_expression_tree_from(lhs), build_expression_tree_from(rhs))
    else
      @expression_factory.create_number_value(expr.to_i)
    end
  end
end
