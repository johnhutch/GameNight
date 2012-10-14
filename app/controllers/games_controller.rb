class GamesController < ApplicationController
	load_and_authorize_resource
  autocomplete :game, :name, :full => true

  def create
    @game = Game.find_by_name(params[:game][:name])
    notice = "Game added."

    if(@game.nil?)
      notice = "Game not in database."
    elsif (current_user.games.include?(@game))
      notice = "This game is already in your collection."
    else
      current_user.games << @game
      notice = "Game added."
    end

    respond_to do |format|
      format.html { redirect_to(dashboard_path, :notice => notice) }
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