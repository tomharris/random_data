module RandomData

  # Methods to create Brazilian CPF number
  module Papers

    def CPF
      numbers = Array.new(9) {rand(9)} 
      digits = Array.new(2) {Array.new}

      for i in 2..10  do  
        digits.first <<  numbers.reverse[i-2] * i 
      end 

      digits[0] = digits.first.inject {|sum,x| sum +x} 
      digits[0] = 11 - (digits.first % 11) 
      digits[0] = 0 if digits.first >= 10

      for i in 3..10  do  
        digits.last <<  numbers.reverse[i-3] * i 
      end 

      digits[1] =  digits.last.inject {|sum,x| sum +x} 
      digits[1] += digits.first * 2 
      digits[1] = 11 - (digits.last % 11) 
      digits[1] = 0 if digits.last >= 10

      numbers += digits

      numbers.join
    end
  end
end
