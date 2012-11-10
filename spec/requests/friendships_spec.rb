require 'spec_helper'

describe "Friends" do
  let(:friend) {FactoryGirl.create(:friend)}
  let(:friend2) {FactoryGirl.create(:friend)}
  let(:friend3) {FactoryGirl.create(:friend)}

  describe "GET /users/:id" do
    it "befriends a user" do
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

    it "does not allow a copy of the same friendship" do
      login(friend)
      @friendship = friend.friendships.build(:friend_id => friend2.id)
      page.should_not have_content("Add Friend")
    end

    it "searches for an befriends a user" do 
      login(friend)
      visit dashboard_path
      fill_in "email", :with => friend2.email
      click_button "Search"
      page.should have_content ("1 user found")
      click_link "Add Friend"
      page.should have_content ("You are friends with")
    end

    it "should not match incomplete searches" do
      login(friend)
      visit dashboard_path
      fill_in "email", :with => "gmail.com"
      click_button "Search"
      page.should have_content ("0 users found")
    end
  end

end
