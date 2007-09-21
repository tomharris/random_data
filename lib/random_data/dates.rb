require 'date'

module RandomData
  
  # Defines methods for random date generation
  
  module Dates
  
    # Returns a date within a specified range of days (plus or minus half what you specify).  The default is ten days, so by default you will
    # get a date within plus or minus five days of today.
    #
    # Example:
    #
    # >> Random.date.to_s = "2007-09-16"
      
    def date(dayrange=10)
      (Date.today + (rand(dayrange*2) - dayrange))
    end

  end
end