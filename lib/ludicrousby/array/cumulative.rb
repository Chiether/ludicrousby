class Array
  # get/replace cumulative numbers. (not bang method)
  # @return [Array<Number>] number of before/after the decimal point.
  # @example
  #  values = [1, 2, 3, 4, 5]
  #  values.cumulative #=> [1, 3, 6, 10, 15]
  #  values # => [1, 2, 3, 4, 5]
  def cumulative
    memo = 0
    return map { |i| memo += i }
  end
  # get/replace cumulative numbers. (bang method)
  # @return [Array<Fixnum/Float>] number of before/after the decimal point.
  # @example bang method
  #  values = [1, 2, 3, 4, 5]
  #  values.cumulative! #=> [1, 3, 6, 10, 15]
  #  values # => [1, 3, 6, 10, 15]
  def cumulative!
    replace cumulative
  end
end
