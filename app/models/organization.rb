class Organization < ActiveRecord::Base
  acts_as_gmappable :lat => 'lat', :lng => 'lng'
  acts_as_mappable
  has_attached_file :avatar, :styles => { 
                    :thumb => '90x',
                    :small => '210x',
                    :medium => '330x',
                    :large => '60x'
                  }, :default_style => :thumb
  has_many :locations
  has_many :organization_users

  scope :owned_by, lambda { |user_id| 
    joins(:organization_users).
    where("organization_users.user_id = ?", user_id) 
  }

  def gmaps4rails_address
    "#{self.address_1}, #{self.city}, #{self.state} #{self.zip_code}"
  end
end
