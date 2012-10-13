class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.boolean :verified

      t.timestamps
    end
  end
end
