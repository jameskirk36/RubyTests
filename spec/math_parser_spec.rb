require_relative "../src/math_parser"

describe "math_parser" do

  before do
    operator_mappings = {
      "-" => "-",
      "+" => "+",
      "*" => "*",
      "/" => "/"
    }
    @parser = MathParser.new(operator_mappings)
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

end
