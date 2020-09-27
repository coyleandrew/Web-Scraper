require 'net/http'

module HttpClient
    def HttpsGet(url)
        uri = URI(url)
        r = Net::HTTP::Get.new uri
        yield(r) if block_given?

        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |c|
            return c.request r
        end

    end

    def HttpsPost(url)
        uri = URI(url)
        r = Net::HTTP::Post.new uri
        yield(r) if block_given?

        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |c|
            return c.request r
        end
    end
end
