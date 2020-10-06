load 'item.rb'
require 'csv'

module ItemsDb

  def save_items(path, items)
    attributes = %w{name location lat long}

    CSV.open(path, "w") do |csv|
      # Header
      csv << attributes

      # Hashy use of the Item object to succinctly convert it to an array of values
      items.each do |item|
        csv << attributes.map{ |attr| item.send(attr) }
      end
    end
  end

  def load_items(fileName)
    if not File.exists? fileName
      raise "Could not load items db, #{fileName} does not exist."
    end

    items = Array.new
    CSV.foreach(fileName, headers:true, converters: :numeric) do |i|
      items.push Item.new i["name"], i["location"], i["lat"], i["long"]
    end

    return items
  end
end