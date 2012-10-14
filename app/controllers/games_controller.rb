class GamesController < ApplicationController
    load_and_authorize_resource
    autocomplete :game, :name, :full => true

    def create
        @game = Game.find_or_create_by_name(params[:game][:name])

        respond_to do |format|
            if @game.save
                if (current_user.games.include?(@game))
                    notice = "This game is already in your collection."
                else
                    current_user.games << @game
                    notice = "Game added."
                end
                format.html { redirect_to(dashboard_path, :notice => notice) }
                format.json { render json: @game, status: :created }
            else
                format.html { redirect_to dashboard_path, notice: t('flash.night_creation_problem') }
                format.json { render json: @night.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @game = Game.find(params[:id])

        current_user.games.delete(@game)

        respond_to do |format|
            format.html { redirect_to(dashboard_path, :notice => 'Game removed.') }
        end
    end

end
