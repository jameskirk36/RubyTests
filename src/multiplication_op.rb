class MultiplicationOp
  def initialize(lhs, rhs)
    @lhs = lhs
    @rhs = rhs
  end

  def evaluate
    @lhs.to_i * @rhs.to_i
  end

  def self.get_mapped_value
    "c"
  end
end

