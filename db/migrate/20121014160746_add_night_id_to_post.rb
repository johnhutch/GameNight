class AddNightIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :night_id, :integer
  end
end
