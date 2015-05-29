class AdditionOp
  def initialize(lhs, rhs)
    @lhs = lhs
    @rhs = rhs
  end

  def self.is_addition(str)
    str.include? "a"
  end

  def evaluate
    @lhs.to_i + @rhs.to_i
  end
end
