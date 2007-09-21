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

  end

end

unless Array.respond_to?(:rand)
  Array.send :include, RandomData::ArrayRandomizer
end