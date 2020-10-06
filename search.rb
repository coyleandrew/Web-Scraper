# frozen_string_literal: true

# search the desired item and return the closest location
class Search
  require 'geocoder'
  load 'items_db.rb'
  include ItemsDb

  def main
    # Get the search text
    puts 'Enter a food item to search for? '
    search = gets.chomp 

    # Get users current address
    puts 'Enter your address: '
    address = gets.chomp 

    # Geocode the user address
    # TODO: Retry for invalid addresses
    loc = user_location(address)

    # all items that match the search text
    # TODO: fuzzy matching, "tacos" has no results, but "taco" does.
    matches = load_items("items.csv").find_all {|item| item.name.downcase.include? search.downcase }

    # take the minimum distance item, in the case of a tie, min_by will return the first.
    closest = matches.min_by { |item| distance(loc, [item.lat, item.long]) }

    # report results
    if closest
      miles = distance(loc, [closest.lat, closest.long])
      puts "We found \"#{closest.name}\" at \"#{closest.location}\", #{miles.round(2)} miles away."
    else
      puts "Could not find any items matching \"#{search}\""
    end
    puts "done"
  end

  # convert address string to geocode
  def user_location(address)
    Geocoder.coordinates(address)
  end

  # compute the distance betweeen two geocode locations
  def distance(a, b)
    Geocoder::Calculations.distance_between(a, b)
  end
end
