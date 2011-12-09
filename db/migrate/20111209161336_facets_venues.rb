class FacetsVenues < ActiveRecord::Migration
  def up
    create_table :facets_venues, :id => false do |t|
      t.references :facet, :venue
    end
    add_index(:facets_venues, [:facet_id, :venue_id], :unique => true)
  end

  def down
    drop_table :facets_venues
  end
end
