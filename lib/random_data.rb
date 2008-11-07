dir = "#{File.dirname(__FILE__)}/random_data"

require "#{dir}/array_randomizer"
require "#{dir}/booleans"
require "#{dir}/contact_info"
require "#{dir}/dates"
require "#{dir}/locations"
require "#{dir}/names"
require "#{dir}/numbers"
require "#{dir}/text"
require "#{dir}/markov"
require "#{dir}/grammar"
require "#{dir}/version"

class Random
  extend RandomData::Booleans
  extend RandomData::ContactInfo
  extend RandomData::Dates
  extend RandomData::Grammar
  extend RandomData::Locations
  extend RandomData::Names
  extend RandomData::Numbers
  extend RandomData::Text

  # Looks for a file in the load path with the name methodname.dat, reads the lines from that file, then gives you a random line from that file.
  # Raises an error if it can't find the file.  For example, given a file named "horse.dat" in your load path:
  # >> Random.horse
  # => "Stallion"
  # >> Random.horse
  # => "Pony"
  # >> Random.horse
  # => "Mare"
  # >> Random.horse
  # => "Clydesdale"
  # >> Random.horse
  # => "Stallion"
  # >> Random.horse
  # => "Mare"
  
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
