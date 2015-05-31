require_relative "number_value"
require_relative "expression_factory"

class MathParser

  def provide_mappings(mappings)
    @mappings = mappings
    mapped_operators = ExpressionFactory.get_supported_operators.map { |op| mappings.key(op) }
    @valid_operator_regex = /[#{Regexp.escape(mapped_operators.join)}]/
    @bracket_start = mappings.key("(")
    @bracket_end = mappings.key(")")
  end

  def split_string_at(str, pos)
    lhs = str[0..pos-1]
    rhs = str[pos+1..-1]
    return lhs, rhs
  end

  def find_next_operator_index(str)
    str.rindex(@valid_operator_regex)
  end

  def valid_index?(index)
    index.nil? == false
  end

  def extract_operator_from(str, index)
    @mappings[str[index]]
  end

  def extract_bracket_section(str)
      start_bracket_index = str.index(@bracket_start)
      end_bracket_index = str.index(@bracket_end)
      str[start_bracket_index..end_bracket_index]
  end

  def remove_brackets(bracket_section)
    bracket_section[1..bracket_section.length-2]
  end

  def has_brackets?(str)
    str.include? @bracket_start
  end

  def parse(str)
    if has_brackets?(str)
      bracket_section = extract_bracket_section(str)
      expr = recursive_parse(remove_brackets(bracket_section))
      str = str.gsub(bracket_section, expr.evaluate.to_s)
    end

    expr = recursive_parse(str)
    expr.evaluate unless expr.nil?
  end

  def recursive_parse(str)
    index = find_next_operator_index(str)
    if valid_index?(index)
      lhs, rhs = split_string_at(str, index)
      operator = extract_operator_from(str, index)
      expr = ExpressionFactory.create_expression(operator, recursive_parse(lhs), recursive_parse(rhs))
    else
      expr = NumberValue.new(str.to_i)
    end
  end
end
