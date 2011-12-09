class ServicesVenues < ActiveRecord::Migration
  def up
    create_table :services_venues do |t|
      t.references :service, :venue
      t.integer :price
    end
    add_index(:services_venues, [:service_id, :venue_id], :unique => true)
  end
 
  def down
    drop_table :services_venues
  end
end
