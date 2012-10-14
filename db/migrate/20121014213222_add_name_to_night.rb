class AddNameToNight < ActiveRecord::Migration
  def change
    add_column :nights, :name, :string
  end
end
