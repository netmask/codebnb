class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.float :latitude
      t.float :longitude
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
