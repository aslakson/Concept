class Picture < ActiveRecord::Base
  has_and_belongs_to_many :venues

  has_attached_file :image, :styles => { 
                    :thumb => '90x',
                    :small => '210x',
                    :medium => '330x',
                    :large => '60x'
                  }, :default_style => :thumb
end
