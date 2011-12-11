class Organization < ActiveRecord::Base
  acts_as_gmappable :check_process => :prevent_geocoding,
                    :msg => "Sorry, not even Google could figure out where that is"
  has_attached_file :avatar, :styles => { :thumbnail => "30x30>", :small => "90x90>", :medium => "210x150>", :large => "330x230>" }
  has_many :locations
  has_many :users
end
