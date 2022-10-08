class AddUniqueToUsers < ActiveRecord::Migration[7.0]
  change_table :users do |t|
    t.index :username, unique: true
  end
end
