require "net/http"

module GameServices
  class GetTopHundredGames
    # Could have those in env var
    URLS = {
      ios: "https://interview-marketing-eng-dev.s3.eu-west-1.amazonaws.com/android.top100.json",
      android: "https://interview-marketing-eng-dev.s3.eu-west-1.amazonaws.com/ios.top100.json"
    }

    def self.call(platform)
      uri = URI(URLS[platform])
      response = Net::HTTP.get(uri)
      JSON.parse(response).flatten
    end
  end
end
