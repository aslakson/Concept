class Picture < ActiveRecord::Base
  has_and_belongs_to_many :venues

  has_attached_file :image, :styles => { 
                    :thumb => '90x90#',
                    :small => '210x115#',
                    :medium => '330x230#',
                    :large => '930x'
                  }, :default_style => :mini
end
