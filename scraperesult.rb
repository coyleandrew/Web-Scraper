class ScrapeResult
  attr_reader :name
  attr_reader :items
  attr_reader :id
  attr_reader :children
  attr_reader :lat
  attr_reader :long


  def initialize(name, id, items, children, lat, long)
    @name, @id, @items, @children, @lat, @long = name, id, items, children, lat, long
  end
end
