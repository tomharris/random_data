require 'date'

module RandomData
  
  # Defines methods for random date generation
  
  module Dates
  
    # Returns a date within a specified range of days.  If dayrange is an Integer, then the date
    # returned will be plus or minus half what you specify.  The default is ten days, so by default 
    # you will get a date within plus or minus five days of today.
    #
    # If dayrange is a Range, then you will get a date the falls between that range
    #
    # Example:
    #
    # Random.date # => a Date +/- 5 days of today
    # Random.date(20) # => a Date +/- 10 days of today
    # Random.date(-60..-30) # => a Date between 60 days ago and 30 days ago  
    #
    def date(dayrange=10)
      if dayrange.is_a?(Range)
        offset = rand(dayrange.max-dayrange.min) + dayrange.min
      else
        offset = rand(dayrange*2) - dayrange
      end
      Date.today + offset
    end
    
    # Returns a date within the specified Range. The Range can be Date or String objects.
    #
    #Example:
    # min = Date.parse('1966-11-15')
    # max = Date.parse('1990-01-01')
    # Random.date(min..max) # => a Date between 11/15/1996 and 1/1/1990
    # Random.date('1966-11-15'..'1990-01-01') # => a Date between 11/15/1996 and 1/1/1990
    #
    def date_between(range)
      min_date = range.min.is_a?(Date) ? range.min : Date.parse(range.min)
      max_date = range.max.is_a?(Date) ? range.max : Date.parse(range.max)

      diff = (max_date - min_date).to_i
      min_date + rand(diff)
    end

  end
end