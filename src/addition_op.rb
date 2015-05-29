class AdditionOp
  def initialize(lhs, rhs)
    @lhs = lhs
    @rhs = rhs
  end

  def evaluate
    @lhs.to_i + @rhs.to_i
  end

  def self.get_mapped_value
    "a"
  end
end
