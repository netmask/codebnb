class CreateVenueImages < ActiveRecord::Migration
  def change
    create_table :venue_images do |t|
      t.string :resource
      t.references :venue_id

      t.timestamps
    end
    add_index :venue_images, :venue_id_id
  end
end
