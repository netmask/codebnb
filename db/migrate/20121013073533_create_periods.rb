class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.datetime :start
      t.datetime :ends
      t.references :venue

      t.timestamps
    end
    add_index :periods, :venue_id
  end
end
