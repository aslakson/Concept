class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :email_address
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :telephone
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    
    add_index :organizations, :email_address, :unique => true
    add_index :organizations, :name
    add_index :organizations, :city
    add_index :organizations, :state
    add_index :organizations, :zip_code
    add_index :organizations, :latitude
    add_index :organizations, :longitude
  end
end
