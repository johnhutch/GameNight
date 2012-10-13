require 'spec_helper'

describe "Friends" do
    let(:user) {FactoryGirl.create(:user)}
    let(:user2) {FactoryGirl.create(:user)}
    let(:user3) {FactoryGirl.create(:user)}

    describe "GET /users/:id" do
        it "sends friend request to user :id" do
            login(user)

            visit user_path(user2)
            click_link I18n.t('links.request_friend')
            page.should have_content(I18n.t('flash.friend_request_sent')
        end
    end

end
