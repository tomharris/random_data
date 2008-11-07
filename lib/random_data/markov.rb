# Methods to create a markov chain from some input text.


module RandomData
  class MarkovGenerator
    
    def initialize(memory = 1)
      @memory_size = memory
      @table = Hash.new {|h,k| h[k] = {}}
      @state = []
    end


    # given the next token of input add it to the
    # table
    def insert(result)
      # puts "insert called with #{result}"
      tabindex = Marshal.dump(@state)
      if @table[tabindex].has_key?(result)
        @table[tabindex][result] += 1
      else
        @table[tabindex][result] = 1
      end
      # puts "table #{@table.inspect}"
      next_state(result)
    end

    def next_state(result)
      @state.shift if @state.size >= @memory_size
      @state.push(result)
      # puts "@state is #{@state.inspect}"
    end

    def generate(n=1, clear_state=false)
      @state = [] if clear_state
      results = []
      n.times do
        retry_count = 0
        begin
          result_hash = @table[Marshal.dump(@state)]
          the_keys,the_vals = [],[]
          result_hash.each_pair do |k,v|
            the_keys << k
            the_vals << v
          end
          # get the weighted random value, by index.
          i = the_vals.roulette
        rescue
          # puts "results:#{result_hash.inspect}";
          # puts "keys:#{the_keys.inspect}";
          # puts "vals:#{the_vals.inspect}";
          # puts "state:#{@state.inspect}";
          @state = []
          retry_count += 1
          if retry_count < 5
            retry 
          else
            # puts
            # puts "table:#{@table.inspect}";
            raise
          end
        end
        result = the_keys[i]
        # puts "index:#{i.inspect}";

        next_state(result)
        if block_given?
          yield result
        end
        results << result
      end
      return results
    end

  end

end
