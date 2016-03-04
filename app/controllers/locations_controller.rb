class LocationsController < ApplicationController
  
  def index
    locations = Location.new
    @locations = locations.locations
  end

  def show
    location = Location.new
    city = params[:id]
    twitter = Adapters::TwitterAdapter.new
    client = twitter.create_client
    @ten_tweets = location.get_location_tweets(client, city)
    flickr = Adapters::FlickrAdapter.new
    @ten_flickr_pics = flickr.photo_urls(city)
  end

end
