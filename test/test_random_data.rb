require File.dirname(__FILE__) + '/test_helper.rb'

class TestRandomData < Test::Unit::TestCase

  def setup
    # to make random numbers deterministic for testing purposes
    srand(100)
  end
  
  def test_should_return_random_phone_number
    assert_equal "620-892-9039", Random.phone
  end

  def test_should_return_random_international_phone
    assert_equal "011-9-34-9039", Random.international_phone
  end
  
  def test_should_return_random_email
    assert_equal "ijones@webmail.com", Random.email
  end

  def test_should_return_random_date
    Date.expects(:today).returns(Date.civil(2007,9,15))
    assert_equal "2007-09-13", Random.date.to_s
  end

  def test_should_return_random_date_with_range
    Date.expects(:today).returns(Date.civil(2007,9,15))
    assert_equal "2007-10-29", Random.date(1500).to_s    
  end
  
  def test_should_return_random_address_line_1
    assert_equal "38408 Highland Blvd", Random.address_line_1    
  end

  def test_should_return_random_address_line_2
    assert_equal "Lot 792", Random.address_line_2    
  end

  def test_should_return_random_zipcode
    assert_equal "38408", Random.zipcode    
  end

  def test_should_return_random_uk_post_code
    assert_equal "BM8 24DB", Random.uk_post_code    
  end

  def test_should_return_random_state
    assert_equal "DE", Random.state    
  end

  def test_should_return_random_state_full
    assert_equal "Delaware", Random.state_full    
  end
  
  def test_should_return_random_country
    assert_equal "Armenia", Random.country    
  end

  def test_should_return_random_city
    assert_equal "Georgetown", Random.city    
  end

  def test_should_return_random_firstname
    assert_equal "Donald", Random.firstname    
  end

  def test_should_return_random_firstnamemale
    assert_equal "Donald", Random.firstname_male 
  end

  def test_should_return_random_firstnamefemale
    assert_equal "Charlotte", Random.firstname_female
  end

  def test_should_return_random_initial
    assert_equal "I", Random.initial    
  end

  def test_should_return_random_lastname
    assert_equal "Clarke", Random.lastname    
  end

  def test_should_return_random_alphanumeric
    assert_equal "8O3dNFmAUqYr2YEY", Random.alphanumeric    
  end

  def test_should_return_random_alphanumeric_with_range
    assert_equal "8O3dNFm", Random.alphanumeric(7)
  end

  def test_should_return_random_paragraphs
    assert_equal 2, Random.paragraphs(2).scan(/\n\n/).size
  end

  def test_should_return_random_paragraphs_with_limit
    num_paragraphs = 5
    assert_equal num_paragraphs, Random.paragraphs(num_paragraphs).scan(/\n\n/).size
  end

  def test_initial_should_not_return_nil
    srand(11) #This would force the nil case in the old implementation
    assert_not_nil Random.initial
  end

  def test_should_return_random_date_using_range
    Date.expects(:today).returns(Date.civil(2007,9,15))    
    assert_equal '1998-03-30', Random.date(-5000..-1000).to_s
  end

  def test_should_return_random_date_between_using_range_of_dates
    min = Date.parse('1966-11-15')
    max = Date.parse('1990-01-01')    
    assert_equal '1982-04-25', Random.date_between(min..max).to_s    
  end
  
  def test_should_return_random_date_between_using_range_of_strings
    assert_equal '1982-04-25', Random.date_between('1966-11-15'..'1990-01-01').to_s    
  end
  
  def test_should_return_random_boolean_true
    srand(99)
    assert_equal true, Random.boolean
  end
  
  def test_should_return_random_boolean_false
    assert_equal false, Random.boolean
  end

  def test_should_return_random_number_less_than_10
    assert_equal 8, Random.number(9)
  end

  def test_should_return_random_bit
    assert_equal 0, Random.bit
  end

  def test_should_return_random_bits
    assert_equal 10, Random.bits(10).size
    assert_equal [0, 1, 0, 0, 0, 0, 1, 0, 0, 1], Random.bits(10)
  end

  def test_should_return_random_number_within_range
    assert_equal 13, Random.number(5..15)
  end

  def test_should_return_random_grammatical_construct
    assert_equal "Bob bites Rover",
      Random::grammatical_construct({:story => [:man, " bites ", :dog],
                         :man => { :bob => "Bob"},
                         :dog => {:a =>"Rex", :b =>"Rover"}},
                         :story)
  end
  
  def test_roulette_wheel_with_positive_weights
    weights=[10,5,1,1];
    results = []
    17.times do
      results << weights.roulette
    end
    assert_equal([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 2, 0],
                 results);
    results = []
    weights.roulette(17) do |i|
      results << i
    end
    assert_equal([0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 results);
  end

  def test_roulette_wheel_with_zero_weights
    weights=[0,0,0];
    assert_raise RuntimeError do
      weights.roulette
    end
    assert_raise RuntimeError do
      x=0
      weights.roulette(1){|i| x=i}
    end
  end

  def test_roulette_wheel_with_negative_weights
    weights=[2,-1,2];
    assert_raise RuntimeError do
      weights.roulette
    end
    assert_raise RuntimeError do
      x=0
      weights.roulette(1){|i| x=i}
    end
  end
end

class TestRandomDataMethodMissing < Test::Unit::TestCase

  def sports
    @sports ||= %w(hockey basketball water\ polo five-a-side football judo pole\ vault steeple\ chase)
  end

  def lines
    @lines ||= sports.join("\r\n")
  end
  
  def path
    @path ||= File.join("lib","sport.dat")
  end

  def setup
    @file = stub('file', :read => lines)
    $:.stubs(:each).yields("lib")
    File.stubs(:exist?).returns(true)    
    File.stubs(:open).yields(@file)
  end

  def test_should_search_load_path_for_file
    $:.expects(:each).yields("lib")
    Random.sport
  end

  def test_should_join_path_with_methodname_dot_dat
    File.expects(:join).with("lib","sport.dat").returns("lib/sport.dat")
    Random.sport
  end
  
  def test_should_test_for_existence_of_filename_matching_method_missing_call
    File.expects(:exist?).with(path).returns(true)
    Random.sport
  end

  def test_should_call_super_if_unable_to_find_file
    # can't test super call directly, so we test whether MethodMissing gets raised properly
    File.stubs(:exist?).returns(false)
    assert_raise(NoMethodError) { Random.horse }
  end
  
  def test_should_open_file_matching_method_missing_call
    File.expects(:open).with(path,"r").yields(@file)
    Random.sport
  end

  def test_should_read_lines_from_file
    @file.expects(:read).returns(@lines)
    Random.sport
  end

  def test_should_return_random_line_from_a_file
    srand(101)
    assert_equal 'steeple chase', Random.sport
    assert_equal 'five-a-side', Random.sport
  end
  
end

class TestRandomDataMarkovGenerator < Test::Unit::TestCase
  def test_markov_generator
    markov_machine = RandomData::MarkovGenerator.new(3)
    text = IO.read "#{File.dirname(__FILE__)}/henry_v_prolog.txt"
    text.split(/\s+/).each do |word|
      markov_machine.insert(word)
    end
    assert_equal(["PROLOGUE", "Enter", "CHORUS",
                 "CHORUS.", "O", "for", "a", "Muse",
                 "of", "fire,", "that", "would", "ascend",
                 "The", "brightest", "heaven", "of",
                 "invention,", "A", "kingdom"],
                 markov_machine.generate(20));
    markov_machine = RandomData::MarkovGenerator.new(3)
    text.scan(/\S{2}|\s+/).each do |word|
      markov_machine.insert(word)
    end
    assert_equal(["PR", "OL", "OG", "UE", "\n\n", "En",
                  "te", " ", "CH", "OR", "US", "\n\n",
                  "CH", "OR", "US", "\n\n", "CH", "OR",
                  "US", "\n\n"],
                 markov_machine.generate(20));
  end
end
