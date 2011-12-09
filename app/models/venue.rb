class Venue < ActiveRecord::Base
  belongs_to :location
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :facets
  has_and_belongs_to_many :services
  has_and_belongs_to_many :ammenities
end
