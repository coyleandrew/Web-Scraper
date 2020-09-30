load 'auxiliary.rb'
require 'geocoder'
include Location

file = File.open('dining_names')
names = file.readlines.map(&:chomp)
names.each do |name|
    locationName = name
    locationAddress = retrieve_add(locationName)
    latLon = Geocoder.coordinates(locationAddress)
    puts "Location Name: #{locationName}"
    puts "Location Address: #{locationAddress}"
    puts "Latitude/Longitude: #{latLon}\n\n"
end