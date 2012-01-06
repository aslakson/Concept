class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :activities, :name, :unique => true
  end
end
