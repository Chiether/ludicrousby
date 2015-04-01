class Float
  # get digit numbers; before and after the decimal point.
  # @return [Integer, Integer] number of before/after the decimal point.
  # @example
  #  (123.45).digit_numbers #=> [3, 2]
  #  (0.0123).digit_numbers #=> [1, 4]
  def digit_numbers
    left, right = to_s.split('.')
    return [left.length, right.length]
  end
end
