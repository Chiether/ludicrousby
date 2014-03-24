module Enumerable
  # get proportions.
  # @return [Array<Number>] converted proportion points (caution: returned float-class but not fixed.)
  # @note Support enumerable of Array, Hash, Range
  # @example
  #  values = [1, 2, 3, 4, 5]
  #  values.proportion(:max) #=> [0.2, 0.4, 0.6, 0.8, 1.0]
  #  values.proportion(:min) #=> [1.0, 2.0, 3.0, 4.0, 5.0]
  #  values.proportion(3) #=> [0.3333333333333333, 0.6666666666666666, 1.0, 1.3333333333333333, 1.6666666666666667]
  def proportion(base)
    hash_mode = self.kind_of?(Hash) ? true : false
    values = hash_mode ? self.values : self.to_a
    base = case base
             when :max; values.max
             when :min; values.min
             else; base
           end
    return case hash_mode
             when true
               Hash[self.map{|key, value| [key, value.to_f / base.to_f]}]
             else
               self.map{|value| value.to_f / base.to_f}
           end
  end
end
