class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :venues
  acts_as_gmappable :check_process => :prevent_geocoding,
                    :msg => "Sorry, not even Google could figure out where that is"

  def gmaps4rails_address
    "#{self.address_1}, #{self.city}, #{self.state}, #{self.zip_code}" 
  end

  def prevent_geocoding
    address_1.blank? || (!latitude.blank? && !longitude.blank?) 
  end
end
