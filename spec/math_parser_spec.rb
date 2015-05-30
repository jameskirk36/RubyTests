require_relative "../src/math_parser"

describe "math_parser" do

  before do
    @parser = MathParser.new
  end

  it "should parse a single value" do
    expect(@parser.parse("3")).to eq(3)
  end

  it "should parse an expression with a single addition operator" do
    expect(@parser.parse("3a4")).to eq(7)
  end

  it "should parse an expression with a single addition operator and large operands" do
    expect(@parser.parse("10a20")).to eq(30)
  end

  it "should parse an expression with a multiplication operator" do
    expect(@parser.parse("2c4")).to eq(8)
  end

end
