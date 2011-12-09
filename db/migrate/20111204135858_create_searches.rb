class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :value
      t.integer :user_id

      t.timestamps
    end
  end
end
