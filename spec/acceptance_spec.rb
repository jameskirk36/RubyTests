require_relative "../src/math_parser"

describe "math_parser" do

  before do
    mappings = {
      "a" => "+",
      "b" => "-",
      "c" => "*",
      "d" => "/",
      "e" => "(",
      "f" => ")"
    }
    @parser = MathParser.new
    @parser.provide_mappings(mappings)
  end

  it "should parse two operators" do
    expect(@parser.parse("3a2c4")).to eq(20)
  end
  it "should parse two different operators" do
    expect(@parser.parse("32a2d2")).to eq(17)
  end
  it "should parse three operators" do
    expect(@parser.parse("500a10b66c32")).to eq(14208)
  end
  it "should parse expression with brackets" do
    expect(@parser.parse("3ae4c66fb32")).to eq(235)
  end
  it "should parse expression with nested brackets" do
    expect(@parser.parse("3c4d2aee2a4c41fc4f")).to eq(990)
  end
end
