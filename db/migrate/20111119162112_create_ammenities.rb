class CreateAmmenities < ActiveRecord::Migration
  def change
    create_table :ammenities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :ammenities, :name, :unique => true
  end
end
