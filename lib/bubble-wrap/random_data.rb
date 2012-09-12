require 'bubble-wrap/loader'

BubbleWrap.require 'lib/random_data/*.rb' do
  file('lib/random_data/random_ext.rb').depends_on [
    'lib/random_data/booleans.rb',
    'lib/random_data/contact_info.rb',
    'lib/random_data/dates.rb',
    'lib/random_data/grammar.rb',
    'lib/random_data/locations.rb',
    'lib/random_data/names.rb',
    'lib/random_data/numbers.rb',
    'lib/random_data/text.rb'
  ]
end
