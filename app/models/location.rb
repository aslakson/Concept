class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :venues
  has_attached_file :avatar, :styles => { 
                    :thumb => '90x',
                    :small => '210x',
                    :medium => '330x',
                    :large => '60x'
                  }, :default_style => :thumb
  acts_as_gmappable :lat => 'lat', :lng => 'lng'
  acts_as_mappable
  
  scope :belonging_to, lambda { |organization_ids| 
    where(:organization_id => organization_ids) 
  }
  
  def gmaps4rails_address
    "#{self.address_1}, #{self.city}, #{self.state} #{self.zip_code}"
  end
end
