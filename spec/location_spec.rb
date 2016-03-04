require_relative 'spec_helper'
require_relative 'rails_helper'

describe Location do
  context '#locations' do 
    it 'can return an array of cities' do
      location = Location.new
      expect(location.locations).to eq(["Berlin", "Istanbul", "Roatan", "Paris"])
    end
  end

  context '#location_tweets' do
    it 'returns 10 tweets' do 
      location = Location.new
      twitter = TwitterConnection.new
      twitter = twitter.create_client
      expect(location.get_location_tweets(twitter, "Berlin").length).to eq(10)
    end

    it 'returns tweets' do 
      location = Location.new
      twitter = TwitterConnection.new
      twitter = twitter.create_client
      expect(location.get_location_tweets(twitter, "Berlin").first).to be_kind_of(Twitter::Tweet)
    end

    it 'returns tweets related to a specific city' do 
      location = Location.new
      twitter = TwitterConnection.new
      twitter = twitter.create_client
      expect(location.get_location_tweets(twitter, "Berlin").first.text).to include("Berlin")
    end

    it 'returns tweets related to a specific city' do 
      location = Location.new
      twitter = TwitterConnection.new
      twitter = twitter.create_client
      expect(location.get_location_tweets(twitter, "Paris").first.text).to include("Paris")
    end


  end
end