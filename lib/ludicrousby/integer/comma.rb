class Integer
  # Integer convert to comma-string for NumberingSystems.
  # @param [Integer] digit_number first digit_number.
  # @param [Integer] reiterate reiteration digit_number(digit_number param. if nil)
  # @return [String] converted comma-string
  # @note
  #  !! THIS METHOD IS NOT ActiveSupport::NumberHelper.number_to_currency !!
  # @note
  #  'Ruby逆引きハンドブック' ISBN978-4863540224 says:
  #  number.to_s.gsub(...)
  #  But its can not support lakh/crore (IndianNumberingSystem)
  # @note
  #  Return thanks to 'Universal Shell Programming Lab' and Tukubai.
  # @see http://en.wikipedia.org/wiki/Indian_Numbering_System
  # @see https://uec.usp-lab.com/
  # @see https://uec.usp-lab.com/TUKUBAI_MAN/CGI/TUKUBAI_MAN.CGI?POMPA=MAN1_comma
  # @example
  #  -12345000.comma(3)   #=> -12,345,000
  #   12345000.comma(4)   #=> 1234,5000
  #  -12345000.comma(3,2) #=> -1,23,45,000
  def comma(digit_number, reiterate = nil)
    return '-' + (-self).comma(digit_number, reiterate) if self < 0
    reiterate ||= digit_number
    digit_number = digit_number.to_i
    reiterate = reiterate.to_i
    transact = self
    partitions = []
    while transact != 0
      separator  =  (10**digit_number)
      partitions << (transact % separator).to_s.rjust(digit_number, '0')
      transact   =  (transact / separator.to_f).to_i
      digit_number = reiterate
    end
    partitions.reverse!
    partitions[0] = partitions[0].to_i.to_s
    return  partitions.join(',')
  end
end
