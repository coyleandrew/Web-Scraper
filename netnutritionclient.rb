load 'httpclient.rb'
load 'item.rb'
require 'nokogiri'

class NetNutritionClient
  include HttpClient
  BASE_URL = "https://dining.osu.edu/NetNutrition"

  def initialize
    response = HttpsGet NetNutritionClient::BASE_URL

    # Save the cookie
    @cookies = response['set-cookie']
  end

  def sample
    # we know where 1 menu is
    result = post "https://dining.osu.edu/NetNutrition/1/Unit/SelectUnitFromTree", 'unitOid' => 1

    # results are json with HTML content
    json = JSON.parse(result.body)
    menu_html = json["panels"][0]["html"]

    # load it into nokogiri
    doc = Nokogiri::HTML(menu_html)

    # select item elements
    items_html = doc.css('.cbo_nn_itemPrimaryRow td[tabindex="0"]')

    # return simple array of items
    items_html.map { |e| Item.new e.text, 39.996782, -83.013649 }
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