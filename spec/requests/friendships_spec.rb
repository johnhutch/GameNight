require 'spec_helper'

describe "Friends" do
    let(:friend) {FactoryGirl.create(:friend)}
    let(:friend2) {FactoryGirl.create(:friend)}
    let(:friend3) {FactoryGirl.create(:friend)}

    describe "GET /users/:id" do
        it "sends friend request to user :id" do
            login(friend)

            visit user_path(friend2)
            click_link I18n.t('links.request_friend')
            page.should have_content(I18n.t('flash.friend_request_sent'))
            page.should have_content("Waiting for" + friend.name + "to respond to your friend request")
        end
    end

end
