class Array
  # get/replace cumulative numbers.
  # @return [Array<Fixnum/Float>] number of before/after the decimal point.
  # @example not bang method
  #  values = [1, 2, 3, 4, 5]
  #  values.cumulative #=> [1, 3, 6, 10, 15]
  #  values # => [1, 2, 3, 4, 5]
  # @example bang method
  #  values = [1, 2, 3, 4, 5]
  #  values.cumulative! #=> [1, 3, 6, 10, 15]
  #  values # => [1, 3, 6, 10, 15]
  def cumulative
    memo = 0
    return self.map{|i| memo+=i}
  end
  def cumulative!
    return self.replace self.cumulative
  end
end
