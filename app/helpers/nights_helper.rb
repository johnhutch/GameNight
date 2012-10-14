module NightsHelper
    def night_game_union(night)
        game_arr = []
        for user in night.users do
            game_arr << user.games
        end
        game_arr.inject(game_arr.first) { |f,x| f = f | x }
    end
end

