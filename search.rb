# frozen_string_literal: true

# search the desired item and return the closest location
class Search
  load 'item.rb'
  require 'geocoder'
  load 'sanitizer.rb'
  attr_reader :set

  def initialize(sets = [])
    @sets = sets
  end

  def main
    puts 'How can I help you? '
    name = gets
    puts 'Enter your address: '
    user = gets
    min = 2**30
    if ture_false(name)
      location = find(user, min)
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
