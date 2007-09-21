$:.unshift File.dirname(__FILE__)
 
require 'lib/random_data/array_randomizer'
require 'lib/random_data/contact_info'
require 'lib/random_data/dates'
require 'lib/random_data/locations'
require 'lib/random_data/names'
require 'lib/random_data/text'

class Random
  extend RandomData::ContactInfo
  extend RandomData::Dates
  extend RandomData::Locations
  extend RandomData::Names
  extend RandomData::Text
end