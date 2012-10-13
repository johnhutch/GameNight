class CreateNightsUsersTable < ActiveRecord::Migration
    def up
        create_table :nights_users, :id => false do |t|
            t.references :night
            t.references :user
        end
        add_index :nights_users, [:night_id, :user_id]
        add_index :nights_users, [:user_id, :night_id]
    end

    def down
        drop_table :nights_users
    end
end
