require 'spec_helper'

describe "Nights" do
    let(:user) {FactoryGirl.create(:user)}

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
            login(user)
            user.nights.create!

            visit dashboard_path
            click_link I18n.t('links.remove_night')
            page.should have_content(I18n.t('flash.night_removed'))
            page.should have_content("You have no game nights set up.")
        end
    end
end
