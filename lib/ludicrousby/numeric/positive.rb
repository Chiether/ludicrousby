class Numeric
  # Is receiver a positive number?
  # @return [Boolean] condition
  # @example
  #  (0.1).positive?   # => true
  #  (0.0).positive?   # => false
  #  (-0.1).positive?  # => false
  def positive?
    return 0 < self
  end
end
