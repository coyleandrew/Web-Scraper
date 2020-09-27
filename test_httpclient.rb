load 'netnutritionclient.rb'
require 'json'
require 'rubygems'
require 'nokogiri'

# Test cookie stuff
test = NetNutritionClient.new
result = test.get "#{NetNutritionClient::BASE_URL}/1"
puts "Test Cookie: #{result.code == "200"}"

# Test get items
results2 = test.post "https://dining.osu.edu/NetNutrition/1/Unit/SelectUnitFromTree", 'unitOid' => 1
puts "Test Menu: #{results2.code == "200"}"

# Test sample items
items = test.sample
puts "Test Sample #{ items.any? { |item| item.name == "Puppy Chow"} }"