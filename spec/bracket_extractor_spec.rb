require_relative "../src/bracket_evaluator.rb"
require_relative "../src/expression_evaluator.rb"

describe "bracket extractor" do
  before do
    @expression_evaluator = ExpressionEvaluator.new(ExpressionFactory.new)
    @bracket_evaluator = BracketEvaluator.new(@expression_evaluator)
    @bracket_evaluator.set_bracket_chars("(",")")
  end

  it "should extract innermost bracket simple" do
    expect(@bracket_evaluator.extract_innermost_bracket_section_from("(inner)")).to eq("(inner)")
  end

  it "should extract innermost bracket from nested brackets" do
    expect(@bracket_evaluator.extract_innermost_bracket_section_from("((inner)outer)")).to eq("(inner)")
  end

end
