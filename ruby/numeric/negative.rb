class Numeric
  # Is receiver a negative number?
  # @return [Boolean] condition
  # @example
  #  (0.1).negative?   # => false
  #  (0.0).negative?   # => false
  #  (-0.1).negative?  # => true
  def negative?
    return 0 > self
  end
end
