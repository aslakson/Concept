class PicturesVenues < ActiveRecord::Migration
  def up
    create_table :pictures_venues, :id => false do |t|
      t.references :picture, :venue
    end
    add_index(:pictures_venues, [:picture_id, :venue_id], :unique => true)
  end
 
  def down
    drop_table :pictures_venues
  end
end
