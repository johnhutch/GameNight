class Night < ActiveRecord::Base
    attr_accessible :name
    has_and_belongs_to_many :users
    has_many :posts, :order => 'created_at DESC', :dependent => :destroy

    def owned_games
        game_arr = []
        for user in self.users do
            game_arr << user.games
        end
        # fun little one liner to remove to duplicates
        # inject steps through the game_arr and does a union with itself
        # on each element of game_arr
        game_arr.inject(game_arr.first) { |f,x| f = f | x }
    end

    def owner
      if self.users.count == 1
        self.users.first
      else
        User.new
      end 
    end
end
