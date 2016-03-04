class Location < ActiveRecord::Base

  def locations
    ["Berlin", "Istanbul", "Roatan", "Paris", "Bangkok"]
  end

  def get_location_tweets(client, location)
    client.search("#'#{location}' -rt", lang: "en").take(10)
  end

end
