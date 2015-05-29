require_relative "../src/math_parser"

describe "math_parser" do
  it "should parse a single value" do
    result = MathParser.parse("3")
    expect(result).to eq(3)
  end
  it "should parse a different single value" do
    result = MathParser.parse("4")
    expect(result).to eq(4)
  end
  it "should parse a simple addition" do
    result = MathParser.parse("3a4")
    expect(result).to eq(7)
  end
  it "should parse a different simple addition" do
    result = MathParser.parse("4a4")
    expect(result).to eq(8)
  end
end
