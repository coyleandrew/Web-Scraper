class Item
  attr_reader :name
  attr_reader :lat
  attr_reader :long
  attr_reader :location

  def initialize(name, location, lat, long)
    @name, @location, @lat, @long = name, location, lat, long
  end
end
