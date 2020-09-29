load 'netnutritionclient.rb'
require 'json'
require 'rubygems'
require 'nokogiri'

# arrange
test = NetNutritionClient.new

# Test cookie stuff
result = test.get "#{NetNutritionClient::BASE_URL}/1"
puts "Test Get: #{result.code == "200"}"

# Test get items
results2 = test.post "https://dining.osu.edu/NetNutrition/1/Unit/SelectUnitFromTree", 'unitOid' => 1
puts "Test Post: #{results2.code == "200"}"

# Test scrape unit
unit = test.scrape_unit 1
puts "Test Scrape Unit: #{ unit.items.any? { |item| item == "Puppy Chow"} }"

# Test scrape unit with children 2 = CAFE OPERATIONS, 6 = Crane Cafe
unit = test.scrape_unit 2
puts "Test Scrape Unit With Children: #{ unit.children.any? { |c| c == "6"} }"

# Test the big one, scrapes everything
all = test.scrape
puts "Test Scrape: #{ all.length == 4221 }"