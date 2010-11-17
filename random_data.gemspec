# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "random_data/version"

Gem::Specification.new do |s|
  s.name        = "random_data"
  s.version     = RandomData::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mike Subelsky", "Tom Harris"]
  s.email       = "thomas.e.harris@gmail.com"
  s.homepage    = "http://github.com/tomharris/random_data"
  s.summary     = "A Ruby gem that provides a Random class with a series of methods for generating random test data including names, mailing addresses, dates, phone numbers, e-mail addresses, and text."
  s.description = "Random data generator"

  s.rubygems_version   = "1.3.7"

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- test/*`.split("\n")
  s.extra_rdoc_files = [ "README.rdoc" ]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end
