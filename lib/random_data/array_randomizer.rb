# Extends the Array class with a function used to randomly choose elements.  Note that if you are using Rails, ActiveSupport recently was updated to include a similar
# function.  This code checks for the presence of that method and does not try to replace it.  They work the same though so no worries.

module RandomData
  module ArrayRandomizer
  
    # Randomly chooses an element from an array
    # >> [1,2,3].rand = 3 
    # [].rand = nil

    def rand
      return self[Kernel.rand(self.size)]
    end

    # Takes an array of non-negative weights
    # and returns the index selected by a 
    # roulette wheel weighted according to those
    # weights.
    # If a block is given then k is used to determine
    # how many times the block is called.  In this
    # case nil is returned.
    def roulette(k=1)
      wheel = []
      weight = 0
      # Create the cumulative array.
      self.each do |x|
        raise "Illegal negative weight #{x}" if x < 0
        wheel.push(weight += x)
      end
      # print "wheel is #{wheel.inspect}\n";
      # print "weight is #{weight.inspect}\n";
      raise "Array had all zero weights" if weight.zero?
      wheel.push(weight + 1) #Add extra element
      if block_given?
        k.times do 
          r = Kernel.rand() # so we don't pick up that from array.
          # print "r is #{r.inspect}\n";
          roll = weight.to_f * r
          # print "roll is #{roll.inspect}\n";
          0.upto(self.size - 1) do |i|
            if wheel[i+1] > roll
              yield i 
              break
            end # if
          end # upto
        end # if block_given?
        return nil
      else
        r = Kernel.rand() # so we don't pick up that from array.
        # print "r is #{r.inspect}\n";
        roll = weight.to_f * r
        # print "roll is #{roll.inspect}\n";
        0.upto(self.size - 1) do |i|
          return i if wheel[i+1] > roll
        end
      end
    end

  end

end

unless Array.respond_to?(:rand)
  Array.send :include, RandomData::ArrayRandomizer
end