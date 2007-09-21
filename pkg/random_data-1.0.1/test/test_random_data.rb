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
    assert_equal "jwalker@webmail.com", Random.email
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
    assert_equal "38408 Virginia Blvd", Random.address_line_1    
  end

  def test_should_return_random_address_line_2
    assert_equal "Lot 792", Random.address_line_2    
  end

  def test_should_return_random_zipcode
    assert_equal 48408, Random.zipcode    
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
    assert_equal "Joseph", Random.firstname    
  end

  def test_should_return_random_initial
    assert_equal "J", Random.initial    
  end

  def test_should_return_random_lastname
    assert_equal "Moore", Random.lastname    
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

end
