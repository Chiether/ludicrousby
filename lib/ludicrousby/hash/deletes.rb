class Hash
  # delete -> deletes.
  # @param [Symbol, Symbol, ...] KEYs
  # @return [Array<Any>] VALUEs
  # @example
  #  hash = {:a=>1, :b=>2, :c=>'I am c'}
  #  hash.delete(:a, :c) #=> [1, 'I am c']
  #  hash #=> {:b=>2}
  def deletes(keys)
    keys.map { |x| delete(x) }
  end
end
