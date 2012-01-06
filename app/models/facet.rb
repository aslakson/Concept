class Facet < ActiveRecord::Base
  has_and_belongs_to_many :venues
  belongs_to :activity
end
