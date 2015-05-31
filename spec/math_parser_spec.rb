require_relative "../src/math_parser"

describe "Math Parser unmapped operators" do

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
    @parser.setup_mappings(mappings)
  end

  it "should evaluate a single value" do
    expect(@parser.evaluate("3")).to eq(3)
  end

  it "should evaluate an expression with a single addition operator" do
    expect(@parser.evaluate("3+4")).to eq(7)
  end

  it "should evaluate an expression with large operands" do
    expect(@parser.evaluate("10+20")).to eq(30)
  end

  it "should evaluate an expression with brackets" do
    expect(@parser.evaluate("3+(2*4)")).to eq(11)
  end

  it "should evaluate an expression with nested brackets" do
    expect(@parser.evaluate("2+(3*(4+1))")).to eq(17)
  end

end
