require 'net/http'

module HttpClient

    def HttpGet url
        uri = URI(url)

        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
            request = Net::HTTP::Get.new uri
            response = http.request request
            return response.body
        end
    end
end
