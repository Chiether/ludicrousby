module Enumerable

  class Table
    def initialize(data)
      @rows = data
    end
    def max
    end
    def min
    end
    def avg
    end
    def lpad!
      max_size = @rows.map(&:size).max
      @rows.map! do |row|
        diff = max_size - row.size
        pad = [nil] * diff
        pad + row
      end
    end
    def rpad!
      max_size = @rows.map(&:size).max
      @rows.map! do |row|
        diff = max_size - row.size
        pad = [nil] * diff
        row + pad
      end
    end

    def ==(value)
      return @rows == value
    end

  end

end
