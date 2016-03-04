# https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=18af3b0f6b54f2ed096e42952bf70744&tags=paris&license=7&safe_search=1&content_type=1&per_page=10&format=json&nojsoncallback=1&auth_token=72157665435891715-703bf04105fdb92f&api_sig=098290865d6278d7871685e65d47cecf

module Adapters
  class FlickrAdapter

    FlickRaw.api_key = ENV['flickr_key']
    FlickRaw.shared_secret = ENV['flickr_secret']
    # https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg

    def photo_urls(city_name)
      city_photos = search_for_photos(city_name)
      city_photos.map{ |photo| FlickRaw.url(photo) }
    end

    def search_for_photos(city_name)
      args = build_search_arguments(city_name)
      flickr.photos.search args
    end

    def build_search_arguments(city_name)
      args = {}
      args[:bbox] = location_boundaries(city_name)
      args[:min_taken_date] = '1890-01-01 00:00:00'
      args[:max_taken_date] = '2016-01-01 00:00:00'
      args[:accuracy] = 1
      args[:per_page] = 10
      args[:text] = "landscape"
      args
    end

    def get_city_location(city_name)
      city_location = flickr.places.find :query => city_name
      latitude = city_location[0]['latitude'].to_f
      longitude = city_location[0]['longitude'].to_f
      [latitude, longitude]
    end

    def location_boundaries(city_name)
      lat_long = get_city_location(city_name)
      radius = 1
      "#{lat_long[1] - radius},#{lat_long[0] - radius},#{lat_long[1] + radius},#{lat_long[0] + radius}"
    end


  end
end
