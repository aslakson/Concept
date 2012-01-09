class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.string :url
      t.string :email
      t.integer :hourly_rate
      t.integer :location_id

      t.timestamps
    end

    add_index :venues, :name
    add_index :venues, :email
    add_index :venues, :location_id
  end
end
