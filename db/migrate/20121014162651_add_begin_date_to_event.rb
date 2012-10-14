class AddBeginDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :begin_date, :date
  end
end
