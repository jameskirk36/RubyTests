require_relative "../src/multiplication_op"
require_relative "../src/addition_op"
require_relative "../src/number_value"

describe "Basic arithmetic" do

  def num(n)
    NumberValue.new(n)
  end

  it "should correctly evaluate addition" do
    expect(AdditionOp.new(num(1), num(1)).evaluate).to eq(2)
  end
  it "should correctly evaluate multiplication" do
    expect(MultiplicationOp.new(num(2), num(2)).evaluate).to eq(4)
  end
end
