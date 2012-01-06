class Organization < ActiveRecord::Base
  acts_as_gmappable :lat => 'lat', :lng => 'lng'
  acts_as_mappable
  has_attached_file :avatar, :styles => { :thumbnail => "30x30>", :small => "90x90>", :medium => "210x150>", :large => "330x230>" }
  has_many :locations
  has_many :organization_users

  scope :owned_by, lambda { |user_id| 
    joins(:organization_users).
    where("organization_users.user_id = ?", user_id) 
  }

  def gmaps4rails_address
    "#{address_1}, #{city}, #{state} #{zip_code}"
  end
end
