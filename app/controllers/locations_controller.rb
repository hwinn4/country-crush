class LocationsController < ApplicationController
  
  def index
    @locations = Location.all
  end

  def show
    location = Location.find(params[:id])
    city_name = location.name
    twitter = Adapters::TwitterAdapter.new
    client = twitter.create_client
    @ten_tweets = twitter.get_location_tweets(client, city_name)
    flickr = Adapters::FlickrAdapter.new
    @ten_flickr_pics = flickr.photo_urls(city_name)
  end

  def create
    location = Location.new(location_params)
    location.save
    redirect_to location_path(location)
  end

  def new
    @location = Location.new
  end

  def update
    location = Location.find(params[:id])
    location.assign_as_favorite
    location.save
    redirect_to root_path
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    redirect_to root_path
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end

end


