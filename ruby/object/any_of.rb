class Object
  # receiver in any of parameters?
  # @param [parameters] params any of cases.
  # @return [Boolean] condition
  # @see https://bugs.ruby-lang.org/issues/9585 #in? has been started to feature's discussion.
  # @example
  #  'sample'.any_of? 1, 2, 'sample'   # => true
  #  'sample'.any_of? [1, 2, 'sample'] # => false
  #  (0.0).any_of? [0.0, 1, 2] #=> true
  #  (0.0).any_of? [0, 1, 2] # => false
  def any_of?(*params)
    return params.any?{|x| x.eql?(self)}
  end
end
