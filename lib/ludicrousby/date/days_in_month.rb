class Date
  # get/replace cumulative numbers. (not bang method)
  # @return [<Number>] number of days in current month
  # @example
  #  DateTime.parse('2000-02-03').days_in_month = 29
  #  DateTime.parse('2001-02-03').days_in_month = 28
  def days_in_month
    target = next_month
    return Date.new(target.year, target.month, 1).prev_day.day
  end
end
