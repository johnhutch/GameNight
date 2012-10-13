require 'spec_helper'

describe "Users" do
  
  describe "GET /users/sign_in" do
    it "displays the login form" do
      visit new_user_session_path
      page.should have_content("Sign in");
    end
  end

  describe "POST /users/sign_in" do
    it "logs the user in" do 
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"
      page.should have_content( I18n.t('devise.sessions.signed_in') )
    end
  end

  describe "GET /users/sign_up" do
    it "displays the signup form" do
      visit new_user_registration_path
      page.should have_content("Sign up")
    end
  end

  describe "POST /users/" do 
    it "signs a user up" do
      visit new_user_registration_path
      page.should have_content("Sign up")
      fill_in "Email", :with => "test@email.com"
      fill_in "Password", :with => "secret"
      fill_in "Confirm Password", :with => "secret"
      fill_in "Name", :with => "New user!"
      click_button "Sign up"
      page.should have_content("New user!")
      page.should have_content( I18n.t('devise.registrations.signed_up') )
    end
  end

  describe "GET /users/:id/games" do
    let(:gamer) {FactoryGirl.create(:gamer)}
    it "shows user name and lists users games" do
      gamer
      visit games_user_path(gamer)
      page.should have_content(gamer.name)
      page.should have_content(gamer.games.first.name)
    end

    it "shows possible games to add as letters are typed" do
      login(gamer)
      visit games_user_path(gamer)
      page.should have_content("Add a game to your collection")
      fill_in "user_games_game_name", :with => "ar"
      page.should have_content("Board Game 6")
    end
  end
end
