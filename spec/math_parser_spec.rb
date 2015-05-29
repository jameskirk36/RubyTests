require_relative "../src/math_parser"

describe "math_parser" do
  it "should parse a single value" do
    expect(MathParser.parse("3")).to eq(3)
  end
  it "should parse a different single value" do
    expect(MathParser.parse("4")).to eq(4)
  end
  it "should parse a simple addition" do
    expect(MathParser.parse("3a4")).to eq(7)
  end
  it "should parse a different simple addition" do
    expect(MathParser.parse("4a4")).to eq(8)
  end
end
