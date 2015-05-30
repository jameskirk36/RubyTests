require_relative "../src/math_parser"

describe "math_parser" do

  before do
    @parser = MathParser.new
  end

  it "should parse two operators" do
    expect(@parser.parse("3a2c4")).to eq(20)
  end
  it "should parse two different operators" do
    expect(@parser.parse("32a2d2")).to eq(17)
  end
end
