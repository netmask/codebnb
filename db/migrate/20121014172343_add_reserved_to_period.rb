class AddReservedToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :reserved, :boolean
  end
end
