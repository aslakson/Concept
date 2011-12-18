class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :venues
  acts_as_gmappable :lat => 'lat', :lng => 'lng'
  acts_as_mappable
  before_validation :geocode_address, :on => :create

  private
  def geocode_address
    geo=Geokit::Geocoders::MultiGeocoder.geocode ("#{address_1} #{city}, #{state} #{zip_code}")
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
end
