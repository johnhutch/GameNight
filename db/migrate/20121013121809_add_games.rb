class AddGames < ActiveRecord::Migration
  def self.up
    
    # Create default list of games
    game = Game.create do |g|
      g.name = "The Settlers of Catan"
    end

    game = Game.create do |g|
      g.name = "Carcassonne"
    end

    game = Game.create do |g|
      g.name = "Puerto Rico"
    end

    game = Game.create do |g|
      g.name = "Dominion"
    end

    game = Game.create do |g|
      g.name = "Agricola"
    end

    game = Game.create do |g|
      g.name = "Power Grid"
    end

    game = Game.create do |g|
      g.name = "Pandemic"
    end

    game = Game.create do |g|
      g.name = "Ticket to Ride"
    end

    game = Game.create do |g|
      g.name = "Citadels"
    end

    game = Game.create do |g|
      g.name = "Race for the Galaxy"
    end

    game = Game.create do |g|
      g.name = "Small World"
    end

    game = Game.create do |g|
      g.name = "Arkham Horror"
    end

    game = Game.create do |g|
      g.name = "Bohnanza"
    end

    game = Game.create do |g|
      g.name = "7 Wonders"
    end

    game = Game.create do |g|
      g.name = "Lost Cities"
    end

    game = Game.create do |g|
      g.name = "Ticket to Ride: Europe"
    end

    game = Game.create do |g|
      g.name = "Caylus"
    end

    game = Game.create do |g|
      g.name = "Stone Age"
    end

    game = Game.create do |g|
      g.name = "Tigris & Euphrates"
    end

    game = Game.create do |g|
      g.name = "Risk"
    end

    game = Game.create do |g|
      g.name = "Battlestar Galactica"
    end

    game = Game.create do |g|
      g.name = "San Juan"
    end

    game = Game.create do |g|
      g.name = "El Grande"
    end

    game = Game.create do |g|
      g.name = "RoboRally"
    end

    game = Game.create do |g|
      g.name = "Alhambra"
    end

    game = Game.create do |g|
      g.name = "Memoir '44"
    end

    game = Game.create do |g|
      g.name = "Chess"
    end

    game = Game.create do |g|
      g.name = "Magic: The Gathering"
    end

    game = Game.create do |g|
      g.name = "Bang!"
    end

    game = Game.create do |g|
      g.name = "Dominion: Intrigue"
    end

    game = Game.create do |g|
      g.name = "Scrabble"
    end

    game = Game.create do |g|
      g.name = "Twilight Struggle"
    end

    game = Game.create do |g|
      g.name = "Munchkin"
    end

    game = Game.create do |g|
      g.name = "Monopoly"
    end

    game = Game.create do |g|
      g.name = "Ra"
    end

    game = Game.create do |g|
      g.name = "Shadows over Camelot"
    end

    game = Game.create do |g|
      g.name = "Thurn and Taxis"
    end

    game = Game.create do |g|
      g.name = "Acquire"
    end

    game = Game.create do |g|
      g.name = "Blokus"
    end

    game = Game.create do |g|
      g.name = "Dixit"
    end

    game = Game.create do |g|
      g.name = "The Princes of Florence"
    end

  end

  def self.down
    
  end
end
