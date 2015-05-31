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
    @parser.setup_mappings(mappings)
  end

  it "should evaluate two operators" do
    expect(@parser.evaluate("3a2c4")).to eq(20)
  end
  it "should evaluate two different operators" do
    expect(@parser.evaluate("32a2d2")).to eq(17)
  end
  it "should evaluate three operators" do
    expect(@parser.evaluate("500a10b66c32")).to eq(14208)
  end
  it "should evaluate expression with brackets" do
    expect(@parser.evaluate("3ae4c66fb32")).to eq(235)
  end
  it "should evaluate expression with nested brackets" do
    expect(@parser.evaluate("3c4d2aee2a4c41fc4f")).to eq(990)
  end
end
