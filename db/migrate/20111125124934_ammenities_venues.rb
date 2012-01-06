class AmmenitiesVenues < ActiveRecord::Migration
  def up
    create_table :ammenities_venues, :id => false do |t|
      t.references :ammenity, :venue
    end
    add_index(:ammenities_venues, [:ammenity_id, :venue_id], :unique => true)
  end
 
  def down
    drop_table :ammenities_venues
  end
end
