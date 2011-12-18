class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :telephone
      t.float :lat
      t.float :lng
      t.boolean :gmaps
      t.integer :organization_id

      t.timestamps
    end
    add_index :locations, :name
    add_index :locations, :city
    add_index :locations, :state
    add_index :locations, :zip_code
    add_index :locations, :lat
    add_index :locations, :lng
    add_index :locations, :organization_id
  end
end
