module RandomData
  # Methods for randomly generating contact data like phone numbers and e-mail addresses
  
  module ContactInfo

   # Returns a randomly-generated string of digits that roughly resembles a US telephone number.  Not guaranteed to be a valid area code.
   def phone
     "#{rand(900) + 100}-#{rand(900)+100}-#{rand(10000)+1000}"
   end

   # Returns a randomly-generated string of digits that roughly resembles an international telephone number as dialed from the US.  
   # Not guaranteed to be a valid number but just good enough to get some sample data going.
   
   def international_phone
    "011-#{rand(100) + 1}-#{rand(100)+10}-#{rand(10000)+1000}"
   end

   # Returns an e-mail address of the form "{first_initial}{last_name}@{domain}"
   def email 
    domains = %w(yahoo.com gmail.com privacy.net webmail.com msn.com hotmail.com example.com privacy.net)
    "#{(initial + lastname).downcase}\@#{domains.rand}"  
   end
 end
end
