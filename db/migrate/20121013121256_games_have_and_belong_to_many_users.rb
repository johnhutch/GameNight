class GamesHaveAndBelongToManyUsers < ActiveRecord::Migration
  def change
    create_table :games_users, :id => false do |t|
      t.references :game, :user
  	end
  end
end
