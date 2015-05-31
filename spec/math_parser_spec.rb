require_relative "../src/math_parser"

describe "math_parser" do

  before do
    mappings = {
      "-" => "-",
      "+" => "+",
      "*" => "*",
      "/" => "/",
      "(" => "(",
      ")" => ")"
    }
    @parser = MathParser.new
    @parser.provide_mappings(mappings)
  end

  it "should parse a single value" do
    expect(@parser.parse("3")).to eq(3)
  end

  it "should parse an expression with a single addition operator" do
    expect(@parser.parse("3+4")).to eq(7)
  end

  it "should parse an expression with a single addition operator and large operands" do
    expect(@parser.parse("10+20")).to eq(30)
  end

  it "should parse an expression with a multiplication operator" do
    expect(@parser.parse("2*4")).to eq(8)
  end

  it "should evaluate an expression with brackets" do
    expect(@parser.parse("3+(2*4)")).to eq(11)
  end

  it "should evaluate an expression with nested brackets" do
    expect(@parser.parse("2+(3*(4+1))")).to eq(17)
  end

  it "should extract innermost bracket section 1" do
    expect(@parser.extract_innermost_bracket_section("(inner)")).to eq("(inner)")
  end

  it "should extract innermost bracket section" do
    expect(@parser.extract_innermost_bracket_section("((inner)outer)")).to eq("(inner)")
  end
end
