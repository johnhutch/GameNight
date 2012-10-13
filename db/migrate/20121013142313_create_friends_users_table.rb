class CreateFriendsUsersTable < ActiveRecord::Migration
  def up
        create_table :friends_users, :id => false do |t|
            t.references :friend
            t.references :user
        end
        add_index :friends_users, [:friend_id, :user_id]
        add_index :friends_users, [:user_id, :friend_id]
  end

  def down
        drop_table :friends_users
  end
end
