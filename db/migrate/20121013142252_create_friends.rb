class CreateFriends < ActiveRecord::Migration
    def change
        create_table :friends do |t|
            t.integer :user_id
            t.integer :friend_id
            t.boolean :ignored, :default => 0
            t.boolean :verified, :default => 0
            t.boolean :blocked, :default => 0

            t.timestamps
        end
    end
end
