class AddUniqueToEvents < ActiveRecord::Migration[7.0]
  def change
    add_index :events, :name, unique: true
  end
end
