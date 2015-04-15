class Range
  # @param [Integer] partitions number of partitions.
  # @param [Integer] after_decimal number of after the decimal point. default:0.
  # @return [Array<Range>] partitioning results.
  # @example desired
  #  (2..11).partitions(10)
  #  # => [2..2, 3..3, 4..4, 5..5, 6..6, 7..7, 8..8, 9..9, 10..10, 11..11]
  #  (2..11).partitions(10,1)
  #  # => [2.0..2.8, 2.9..3.7, 3.8..4.6, 4.7..5.5, 5.6..6.4, 6.5..7.4, 7.5..8.3, 8.4..9.2, 9.3..10.1, 10.2..11.0]
  # @example undesired
  #  (0.2..0.7).partitions(3)
  #  # => [0..0, 1..0]     ... i think its intractableness for soft landing.
  #  (11..2).partitions(10)
  #  # => []
  def partitions(partitions, after_decimal = 0)
    left, right = first, last
    partitions, after_decimal  = partitions.to_i, after_decimal.to_i
    tick        = 1.0 / (10**after_decimal)
    interval    = ((right.to_f - left.to_f + tick) / partitions) - tick
    result = []
    while left <= right
      a = left
      b = (left += interval) < right ? left : right
      result << Range.new(a.round(after_decimal), b.round(after_decimal))
      left += tick
    end
    return result
  end
end
