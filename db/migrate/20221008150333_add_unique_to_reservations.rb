class AddUniqueToReservations < ActiveRecord::Migration[7.0]
  change_table :reservations do |t|
      t.index [:user_id, :event_id], unique: true
  end
end
