module Adapters
  class TwitterAdapter

    def create_client
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['twitter_consumer_key']
        config.consumer_secret     = ENV['twitter_consumer_secret']
        config.access_token        = ENV['twitter_access_token']
        config.access_token_secret = ENV['twitter_access_token_secret']
      end
    end

    def get_location_tweets(client, location)
      client.search("#'#{location}' -rt", lang: "en").take(10)
    end

  end
end

