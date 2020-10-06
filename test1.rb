gem 'fuzzy_match'
require 'fuzzy_match'

puts FuzzyMatch.new(['taco', 'bagel', 'chips']).find('tac')

