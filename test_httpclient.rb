load 'httpclient.rb'

class TestHttpClient
    include HttpClient

    def Test
        result = HttpGet "https://dining.osu.edu/NetNutrition/1"
        return result
    end
end

test = TestHttpClient.new
puts test.Test