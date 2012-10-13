class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user
      t.string :status
      t.references :period

      t.timestamps
    end
    add_index :reservations, :user_id
    add_index :reservations, :period_id
  end
end
