class CreateNights < ActiveRecord::Migration
  def change
    create_table :nights do |t|

      t.timestamps
    end
  end
end
