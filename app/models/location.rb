class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :venues
  acts_as_gmappable :lat => 'lat', :lng => 'lng'
  acts_as_mappable
  
  scope :belonging_to, lambda { |organization_ids| 
    where(:organization_id => organization_ids) 
  }
  
  def gmaps4rails_address
    "#{address_1}, #{city}, #{state} #{zip_code}"
  end
end
