module Enumerable
  # get proportions.
  # @param [Numeric, Symbol] base Numeric using param. :max using max in values. :min using min in values.
  # @return [Array<Number>] converted proportion points (caution: returned float-class but not fixed.)
  # @note Support enumerable of Array, Hash, Range
  # @example
  #  [1, 2, 3, 4, 5].proportion(:max) #=> [0.2, 0.4, 0.6, 0.8, 1.0]
  #  {:a=>3, :b=>2, :c=>4}.proportion(:min)  #=> {:a=>1.5, :b=>1.0, :c=>2.0}
  #  (2..6).proportion(4) #=> [0.5, 0.75, 1.0, 1.25, 1.5]
  def proportion(base = :max)
    hash_mode = self.is_a?(Hash) ? true : false
    values = hash_mode ? self.values : to_a
    base = values.send(base) if [:max, :min].include?(base)
    return case hash_mode
           when true
             Hash[map { |key, value| [key, value.to_f / base.to_f] }]
           else
             map { |value| value.to_f / base.to_f }
           end
  end
end
