class Numeric
  # receiver is zero?
  # @return [Boolean] condition
  # @example
  #  0.zero?     # => true
  #  (0.0).zero? # => false
  #  1.zero?     # => false
  # @author Norikaz Ishii - initialize.
  def zero?
    return 0 == self
  end
end
