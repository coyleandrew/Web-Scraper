load 'httpclient.rb'
load 'item.rb'
load 'scraperesult.rb'
load 'auxiliary.rb'
require 'nokogiri'
require 'geocoder'

class NetNutritionClient
  include HttpClient
  include Location
  BASE_URL = "https://dining.osu.edu/NetNutrition"
  UNITS_URL = "/1/Unit/SelectUnitFromTree"

  def initialize
    response = HttpsGet NetNutritionClient::BASE_URL

    # Save the cookie
    @cookies = response['set-cookie']
  end

  def scrape
    # get the home page, this has all the top level locations
    home = get "#{BASE_URL}/1"

    # load the page into nokogiri
    doc = Nokogiri::HTML(home.body)

    locations_html = doc.css(".cbo_nn_unitTreeListDiv a").map { |a| a.attr("onclick") }
    locationIds = locations_html.map { |l| /\d+/.match(l).to_s }

    locations = Array.new
    # Locations only have one level of children. A nested loop will suffice
    locationIds.each.with_index do |id, i|
      puts "Scraping category #{i+1} of #{locationIds.length}"
      result = scrape_unit id
      locations.push result
      result.children.each { |id| locations.push scrape_unit id }
    end

    # flatten the data
    items = locations.collect { |l| l.items.map { |item| Item.new item, l.name, l.lat, l.long } }
    return  items.flatten
  end

  def scrape_unit(id)
    # post for the unit data
    result = post "https://dining.osu.edu/NetNutrition/1/Unit/SelectUnitFromTree", 'unitOid' => id

    # results are json with HTML content
    json = JSON.parse(result.body)
    menu_html = json["panels"][0]["html"]
    children_html = json["panels"][2]["html"]

    # load location menu it into nokogiri
    doc = Nokogiri::HTML(menu_html)

    # select location name
    locationName = doc.css(".cbo_nn_itemHeaderDiv").text

    # select item elements
    items_html = doc.css(".cbo_nn_itemPrimaryRow td[tabindex=\"0\"]")

    # map item elements to item text
    items = items_html.map(&:text)

    # collect the child locations
    doc = Nokogiri::HTML(children_html)

    # select child locations
    locations_onclick = doc.css(".cbo_nn_unitNameLink")
    locations_onclick_text = locations_onclick.map { |a| a.attr("onclick") }

    # match just the ids
    locations = locations_onclick_text.map { |l| /\d+/.match(l).to_s } if locations_onclick

    # get location address from location name
    locationAddress = retrieve_add(locationName)

    # calculate lat/lon from address
    latLon = Geocoder.coordinates(locationAddress)

    if locationAddress
      lat = latLon[0]
      long = latLon[1]
    end

    ScrapeResult.new locationName, id, items, locations, lat, long
  end

  def get(url)
    HttpsGet(url) { |r| r["Cookie"] = @cookies }
  end

  def post(url, form)
    HttpsPost(url) do |r|
      r["Cookie"] = @cookies
      r.set_form_data(form)
    end
  end
end