module RandomData
  module Numbers
    #n can be an Integer or a Range.  If it is an Integer, it just returns a random
    #number greater than or equal to 0 and less than n.  If it is a Range, it
    #returns a random number within the range
    # Examples
    #
    # >> Random.number(5)
    # => 4
    # >> Random.number(5)
    # => 2
    # >> Random.number(5)
    # => 1
    def number(n)
      n.is_a?(Range) ? n.to_a.rand : rand(n) 
    end

    # return a random bit, 0 or 1.
    def bit
      rand(2)
    end

    # return an array of n random bits.
    def bits(n)
      x = []
      n.times {x << bit}
      x
    end

  end
end
