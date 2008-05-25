
module RandomData
  
  # Defines methods for the generation of random data based on a supplied grammar.
  
  module Grammar
  
    # Returns simple sentences based on a supplied grammar, which must be a hash, the
    # keys of which are symbols.  The values are either an array of successive values or a grammar 
    # (i.e, hash with symbols as keys, and hashes or arrays as values.  The arrays contain symbols 
    # referencing the keys in the present grammar, or strings to be output. The keys are always symbols.
    #
    # Example:
    # Random.grammatical_construct({:story => [:man, " bites ", :dog], :man => { :bob => "Bob"}, :dog => {:a =>"Rex", :b =>"Rover"}}, :story)
    # => "Bob bites Rover"
    
    def grammatical_construct(grammar, what=nil)
      output = ""
      if what.nil?
        case grammar
        when Hash
          a_key = grammar.keys.sort_by{rand}[0]
          output += grammatical_construct(grammar, a_key)
        when Array
          grammar.each do |item|
            output += grammatical_construct(item)
          end
        when String
          output += grammar
        end
      else
        rhs = grammar[what]
        case rhs
        when Array
          rhs.each do |item|
            case item
            when Symbol
              output += grammatical_construct(grammar,item)
            when String
              output += item
            when Hash
              output += grammatical_construct(item)
            else
              raise "#{item.inspect} must be a symbol or string or Hash"
            end
          end
        when Hash
          output+= grammatical_construct(rhs)
        when Symbol
          output += grammatical_construct(rhs)
        when String
          output += rhs
        else
          raise "#{rhs.inspect} must be a symbol, string, Array or Hash"
        end
      end
      return output
    end

  end
end
