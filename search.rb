# frozen_string_literal: true

# search the desired item and return the closest location
class Search
  load 'item.rb'
  require 'geocoder'
  load 'sanitizer.rb'
  load 'items_db.rb'
  include ItemsDb
  attr_reader :set

  def initialize(sets = [])
    @sets = sets
  end

  def main
    # Get name of item from user
    puts 'How can I help you? '
    name = gets

    # Get users current address
    puts 'Enter your address: '
    address = gets
    min = 2**30
    #if ture_false(name) -----> Commented out for testing

    puts load_items("items.csv").find {|item| item.name.include? name }
    if false
      location = find(address, min)
      puts 'The nearest location is ' + location
    else
      puts 'Cannot find ' + name
    end
  end

  def ture_false(name)
    result = groupLocation(item)
    if result.value?(name)
      @set << result.index(name)
      true
    else
      false
    end
  end

  def find(user, min)
    @sets.each do |locate|
      if distance(user, locate) < min
        min = distance(user, locate)
        location = locate
      end
    end
    location
  end

  def get_location(location)
    location_address = retrieve_add(location)
    lat_lon = Geocoder.coordinates(location_address)
    lat_lon
  end

  def user_location(user)
    lat_lon = Geocoder.coordinates(user)
    lat_lon
  end

  def distance(user, location)
    Geocoder::Calculations.distance_between([user_location(user)], [get_location(location)])
  end
end
