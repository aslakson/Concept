class ActivitiesVenues < ActiveRecord::Migration
  def up
    create_table :activities_venues, :id => false do |t|
      t.references :activity, :venue
    end
    add_index(:activities_venues, [:activity_id, :venue_id], :unique => true)
  end
 
  def down
    drop_table :activities_venues
  end
end
