class Location < ActiveRecord::Base
  has_many :cohorts, dependent: :destroy

  def where
    city.capitalize + ", " + state.upcase
  end
end
