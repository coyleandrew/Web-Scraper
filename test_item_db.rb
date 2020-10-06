load 'netnutritionclient.rb'
load 'items_db.rb'

class TestItemsDb
  include ItemsDb
  
  def initialize
    
  end
  
  def test_save(fileName, items)
    save_items fileName, items
  end

  def test_load(fileName)
    load_items fileName
  end
end

# arrange
test_items = NetNutritionClient.new
test_db = TestItemsDb.new

# scrape everything
#items = test_items.scrape
# save items
#test_db.test_save "items.csv", items
# verify saved
puts "Test Save: #{ File.exists?("items.csv") }"

# test load
load_items = test_db.test_load("items.csv")
##puts "Test Load: #{ load_items.length == items.length }"

name = "Latte"
latte = load_items.find {|item| item.name.include? name}
puts latte