class Night < ActiveRecord::Base
    attr_accessible :name
    has_and_belongs_to_many :users
    has_many :posts, :order => 'created_at DESC'

    def owned_games
        game_arr = []
        for user in self.users do
            game_arr << user.games
        end
        game_arr.inject(game_arr.first) { |f,x| f = f | x }
    end
end
