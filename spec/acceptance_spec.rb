require_relative "../src/math_parser"

describe "math_parser" do

  before do
    @parser = MathParser.new
  end

  it "should parse two operators" do
    expect(@parser.parse("3a2c4")).to eq(20)
  end
end
