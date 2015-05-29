class MultiplicationOp
  def initialize(lhs, rhs)
    @lhs = lhs
    @rhs = rhs
  end

  def evaluate
    @lhs.evaluate * @rhs.evaluate
  end

  def self.get_mapped_value
    "c"
  end
end

