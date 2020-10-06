# frozen_string_literal: true

# search the desired item and return the closest location
class Search
  require 'geocoder'
  require 'fuzzy_match'
  load 'items_db.rb'
  include ItemsDb

  def main
    # Get the search text
    puts 'Enter a food item to search for? '
    search = gets.chomp 

    # Get users current address
    puts 'Enter your address: '
    address = gets.chomp

    # do the search
    self.do_search(address, search)
  end

  def do_search(address, search)
    # Geocode the user address
    loc = user_location(address)
    while loc == nil && address != "q"
      puts "Invalid address. Please enter a new address or press 'q' to quit:"
      address = gets.chomp
      loc = user_location(address)
    end

    if address != "q"
      # Load all items into array
      item_list = load_items("items.csv")

      # name_list will contain item.name for all items
      name_list = []

      # Gather all the item.names and place into name_list
      item_list.each {|item| name_list.push(item.name)}

      # Find closest matched item that user enters
      user_item = FuzzyMatch.new(name_list).find(search)

      # Find all items that match user input
      matches = item_list.find_all {|item| item.name.downcase.include? user_item.downcase }

      # take the minimum distance item, in the case of a tie, min_by will return the first.
      closest = matches.min_by { |item| distance(loc, [item.lat, item.long]) }

      # report results
      if closest
        miles = distance(loc, [closest.lat, closest.long])
        puts "We found \"#{closest.name}\" at \"#{closest.location}\", #{miles.round(2)} miles away."
      else
        puts "Could not find any items matching \"#{search}\""
      end
    end
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
