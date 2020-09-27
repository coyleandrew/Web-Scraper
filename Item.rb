class Item
  attr_reader :name
  attr_reader :lat
  attr_reader :long

  def initialize(name, lat, long)
    @name, @lat, @long = name, lat, long
  end
end
