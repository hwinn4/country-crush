# == Schema Information
#
# Table name: locations
#
#  id   :integer          not null, primary key
#  name :string
#

# name
class Location < ActiveRecord::Base

  DEFAULT_LOCATIONS = ["Berlin", "Istanbul", "Roatan", "Paris", "Bangkok"]

  def get_location_tweets(client, location)
    client.search("#'#{location}' -rt", lang: "en").take(10)
  end

end
