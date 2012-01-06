class CreateFacets < ActiveRecord::Migration
  def change
    create_table :facets do |t|
      t.string :name
      t.text :description
      t.integer :activity_id

      t.timestamps
    end
  end
end
