class AdditionOp
  def initialize(lhs, rhs)
    @lhs = lhs
    @rhs = rhs
  end

  def evaluate
    @lhs.evaluate + @rhs.evaluate
  end

  def self.char
    "a"
  end
end
