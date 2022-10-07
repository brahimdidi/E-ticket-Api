class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_date
      t.string :photo
      t.string :location
      t.integer :ticket_price
      t.integer :seats_available

      t.timestamps
    end
  end
end
