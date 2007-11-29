$:.unshift File.dirname(__FILE__)

require 'random_data/array_randomizer'
require 'random_data/booleans'
require 'random_data/contact_info'
require 'random_data/dates'
require 'random_data/locations'
require 'random_data/names'
require 'random_data/numbers'
require 'random_data/text'

class Random
  extend RandomData::Booleans
  extend RandomData::ContactInfo
  extend RandomData::Dates
  extend RandomData::Locations
  extend RandomData::Names
  extend RandomData::Numbers
  extend RandomData::Text

  # Looks for a file with the name methodname.dat, reads the lines from that file, then gives you a random line from that file
  # Will also search your load path for the file.  Raises an error if it can't find the file.
  
  def self.method_missing(methodname)
    thing = "#{methodname}.dat"
    filename = find_path(thing)

    if filename.nil?
      super
    else
      array = []
      File.open(filename, 'r') { |f| array = f.read.split(/[\r\n]+/) }
      return array.rand
    end
  end
  
  private
  
  def self.find_path(filename)
    $:.each do |path|
      new_path = File.join(path,filename)
      return new_path if File.exist?(new_path)
    end    
    return nil
  end
  
end
