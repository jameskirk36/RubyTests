require_relative "../src/multiplication_op"
require_relative "../src/addition_op"
require_relative "../src/subtraction_op"
require_relative "../src/division_op"
require_relative "../src/number_value"

describe "Basic arithmetic" do

  def num(n)
    NumberValue.new(n)
  end

  it "should correctly evaluate addition" do
    expect(AdditionOp.new(num(1), num(1)).evaluate).to eq(2)
  end
  it "should correctly evaluate subtraction" do
    expect(SubtractionOp.new(num(2), num(1)).evaluate).to eq(1)
  end
  it "should correctly evaluate multiplication" do
    expect(MultiplicationOp.new(num(2), num(2)).evaluate).to eq(4)
  end
  it "should correctly evaluate division" do
    expect(DivisionOp.new(num(4), num(2)).evaluate).to eq(2)
  end
end
