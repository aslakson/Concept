class Venue < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :thumbnail => "30x30>", :small => "90x90>", :medium => "210x150>", :large => "330x230>" }
  belongs_to :location
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :facets
  has_and_belongs_to_many :services
  has_and_belongs_to_many :ammenities
  has_and_belongs_to_many :pictures
  
end