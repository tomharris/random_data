module RandomData
  module Numbers
    #n can be an Integer or a Range.  If it is an Integer, it just returns a random
    #number greater than or equal to 0 and less than n.  If it is a Range, it
    #returns a random number within the range
    # Examples
    #
    #
    def number(n)
      n.is_a?(Range) ? n.to_a.rand : rand(n) 
    end
  end
end