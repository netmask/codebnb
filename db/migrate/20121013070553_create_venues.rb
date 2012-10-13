class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.references :user
      t.float :latitude
      t.float :longitude
      t.string :label
      t.text :description
      t.boolean :work_place
      t.boolean :meals
      t.boolean :internet
      t.text :disclamer
      t.boolean :mates_allowed
      t.integer :mates_quantity
      t.references :city

      t.timestamps
    end
    add_index :venues, :user_id
    add_index :venues, :city_id
  end
end
