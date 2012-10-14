require 'spec_helper'

describe "Friends" do
    let(:friend) {FactoryGirl.create(:friend)}
    let(:friend2) {FactoryGirl.create(:friend)}
    let(:friend3) {FactoryGirl.create(:friend)}

    describe "GET /users/:id" do
        it "sends befriends a user" do
            login(friend)

            visit user_path(friend2)
            click_link I18n.t('links.add_friend')
            page.should have_content(I18n.t('flash.friendship_added'))
            page.should have_content("You are friends with")
        end

        it "deletes a friendship" do
            login(friend)
            @friendship = friend.friendships.build(:friend_id => friend3.id)
            @friendship.save!

            visit user_path(friend3)
            page.should have_content("You are friends with")
            click_link I18n.t('links.remove_friend')
            page.should have_content(I18n.t('flash.removed_friendship'))
            page.should have_content(I18n.t('links.add_friend'))
        end
    end

end
