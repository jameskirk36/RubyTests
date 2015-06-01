class BracketEvaluator

  def initialize(expression_evaluator)
    @evaluator = expression_evaluator
  end

  def set_bracket_chars(bracket_open_char, bracket_close_char)
    @bracket_open_char = bracket_open_char
    @bracket_close_char = bracket_close_char
  end

  def recursive_bracket_evaluation(expr)
    if has_brackets?(expr)
      section = extract_innermost_bracket_section_from(expr)
      tree = @evaluator.build_expression_tree_from(remove_brackets(section))
      expr = StringUtils.replace_string_in_string(expr, section, tree.evaluate.to_s)
      recursive_bracket_evaluation(expr) 
    else
      expr
    end
  end

  def extract_innermost_bracket_section_from(expr)
    start_pos = expr.rindex(@bracket_open_char)
    end_pos = expr.index(@bracket_close_char)
    if start_pos.nil? || end_pos.nil?
      expr
    else
      expr[start_pos..end_pos]
    end
  end

  private

  def has_brackets?(expr)
    expr.include? @bracket_open_char
  end

  def remove_brackets(bracket_section)
    bracket_section[1..bracket_section.length-2]
  end

end
