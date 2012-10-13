class AddRoomsToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :rooms, :integer
  end
end
