# == Schema Information
#
# Table name: locations
#
#  id       :integer          not null, primary key
#  name     :string
#  favorite :boolean          default(FALSE)
#

# name
class Location < ActiveRecord::Base

  DEFAULT_LOCATIONS = ["Berlin", "Istanbul", "Roatan", "Paris", "Bangkok"]


  def assign_as_favorite
    status = self.favorite
    if status
      self.favorite = FALSE
    else
      self.favorite = TRUE
    end
  end

end
