require 'spec_helper'

describe "Nights" do
    let(:night) {FactoryGirl.create(:night)}
    let(:user) {FactoryGirl.create(:friend)}
    let(:user2) {FactoryGirl.create(:friend)}
    let(:user3) {FactoryGirl.create(:friend)}
    let(:user4) {FactoryGirl.create(:friend)}
    let(:game) {FactoryGirl.create(:game)}
    let(:game2) {FactoryGirl.create(:game)}
    let(:game3) {FactoryGirl.create(:game)}
    let(:game4) {FactoryGirl.create(:game)}
    let(:game5) {FactoryGirl.create(:game)}
    let(:game6) {FactoryGirl.create(:game)}
    let(:game7) {FactoryGirl.create(:game)}
    let(:game8) {FactoryGirl.create(:game)}

    describe "POST /nights" do
        it "gamer user can create a game night" do
            login(user)

            visit dashboard_path
            fill_in "night_name", :with => "Sample Night"
            click_button I18n.t('buttons.create_night')
            page.should have_content(I18n.t('flash.night_created'))
            page.should have_content("Sample Night")
        end

        it "gamer can delete a game night" do
            user
            user2
            user3
            login(user)
            user.nights.create!

            visit dashboard_path
            click_link I18n.t('links.remove_night')
            page.should have_content(I18n.t('flash.night_removed'))
            page.should have_content("You have no game nights set up.")
        end
    end

    describe "SHOW /night/:id" do
        it "shows all of the games owned by the night across all users" do
            user.games << game
            user.games << game2
            user.games << game3
            user2.games << game3
            user2.games << game4
            user2.games << game5
            user3.games << game5
            user3.games << game6
            user3.games << game7
            user4.games << game7
            user4.games << game8

            night.users << user
            night.users << user2
            night.users << user3
            night.users << user4

            visit night_path(night)

            page.should have_content(user2.name)
            page.should have_content(game3.name)
            page.should have_content(game6.name)
        end
    end
end
