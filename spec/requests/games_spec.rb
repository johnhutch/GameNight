require 'spec_helper'

describe "Users" do
  let(:game1) {FactoryGirl.create(:game)}
  let(:game2) {FactoryGirl.create(:game)}
  let(:game3) {FactoryGirl.create(:game)}
  

  describe "GET /users/:id/games" do
    let(:gamer) {FactoryGirl.create(:gamer)}
    it "shows user name and lists users games" do
      gamer
      visit dashboard_path(gamer)
      page.should have_content(gamer.name)
      page.should have_content(gamer.games.first.name)
    end

# selenium not detecting drop down, research required
#    it "shows possible games to add as letters are typed", :js => true do
#      catan = FactoryGirl.create(:game, name: "The Settlers of Catan")
#      login(gamer)
#      visit games_user_path(gamer)
#      page.should have_content("Add a game to your collection")
#      fill_in "user_games_game_name", :with => "Catan"
#      page.should have_content(catan.name)
#    end

    it "shows new list of games with newly added game", :js => true do
      catan = FactoryGirl.create(:game, name: "The Settlers of Catan")
      gamer
      login(gamer)
      visit dashboard_path(gamer)
      fill_in "user_games_game_name", :with => catan.name
      click_button "Add game"
      page.should have_content(catan.name)
    end

    it "deletes a game from a collection after clicking the remove link", :js => true do
      gamer
      login(gamer)
      visit dashboard_path(gamer)
      click_link "remove_game_2"
      page.should_not have_content("Board Game 8")
    end
  end
end
