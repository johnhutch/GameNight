require 'spec_helper'

describe "Nights" do
  let(:night1) {FactoryGirl.create(:night)}
  let(:user1) {FactoryGirl.create(:friend)}
  let(:user2) {FactoryGirl.create(:friend)}
  let(:user3) {FactoryGirl.create(:friend)}
  let(:user4) {FactoryGirl.create(:friend)}
  let(:game1) {FactoryGirl.create(:game)}
  let(:game2) {FactoryGirl.create(:game)}
  let(:game3) {FactoryGirl.create(:game)}
  let(:game4) {FactoryGirl.create(:game)}
  let(:game5) {FactoryGirl.create(:game)}
  let(:game6) {FactoryGirl.create(:game)}
  let(:game7) {FactoryGirl.create(:game)}
  let(:game8) {FactoryGirl.create(:game)}
  let(:post1) {FactoryGirl.create(:post)}

  let(:author1) {FactoryGirl.create(:author)}
  let(:post1) {FactoryGirl.create(:post)}
  let(:photo) { FactoryGirl.create(:photo, user: user1) }
  let(:nobody1) {FactoryGirl.create(:nobody)}

  describe "POST /nights" do
    it "gamer user can create a game night" do
      login(user1)

      visit dashboard_path
      fill_in "night_name", :with => "Sample Night"
      click_button I18n.t('buttons.create_night')
      page.should have_content(I18n.t('flash.night_created'))
      page.should have_content("Sample Night")
    end
  end

  describe "EDIT /night/:id" do 
    it "player can edit a game night" do
      login(user1)

      night1
      night1.users << user1

      visit night_path(night1)
      click_link("Edit This Game Night")
      fill_in "Name", :with => "New Game Night Title"
      click_button "Update Night"
      page.should have_content("successfully updated")
      page.should have_content("New Game Night Title")
    end
  end

  describe "SHOW /night/:id" do

    it "should not allow a user to see a Game Night if they are not a member" do
      login(user1)

      night1
      night1.users.pop

      visit night_path(night1)
      page.should have_content("You are not authorized")
    end

    it "should allow a user to see a Game Night if they are a member" do
      login(user1)

      night1
      night1.users << user1

      visit night_path(night1)
      page.should have_content(night1.name)
    end

    it "shows all of the games owned by the night across all users" do
      user1.games << game1
      user1.games << game2
      user1.games << game3

      user2.games << game3
      user2.games << game4
      user2.games << game5

      user3.games << game5
      user3.games << game6
      user3.games << game7

      user4.games << game7
      user4.games << game8

      night1.users << user1
      night1.users << user2
      night1.users << user3
      night1.users << user4

      login(user1)

      visit night_path(night1)

      page.should have_content(game1.name)
      page.should have_content(game3.name)
      page.should have_content(game6.name)
    end

    it "should allow an author to post a post", :js => true do
      login(author1)
      night1.users << author1

      visit new_night_post_path(night1)
      fill_in "Title", :with => "A Sample Game Night Post Title"
      fill_in "Body", :with => "this is a post that belongs to a game night"
      click_link I18n.t('links.add_a_photo')
      fill_in "Photo Title", :with => "A Sample Game Night Photo Title"
      fill_in "Photo Caption", :with => "this is the photo caption that belongs to game night"
      attach_file("File Upload","#{Rails.root}/spec/samples/hutchhead.png")
      click_button I18n.t('buttons.create_post')
      page.should have_content("A Sample Game Night Post Title")
      page.should have_content("A Sample Game Night Photo Title")
      page.should have_content("this is the photo caption that belongs to game night")
      page.should_not have_content ("Posted by No Name")
      page.should have_xpath("//img[contains(@src,\"hutchhead.png\")]") 
    end

    it "should fail validation when the title and body are not filled out" do
      login(author1)

      visit new_night_post_path(night1)
      click_button I18n.t('buttons.create_post')
      page.should have_content("Title can't be blank")
      page.should have_content("Body can't be blank")
    end

    it "should not allow a vanilla user to post a post" do
      login(nobody1)

      visit new_night_post_path(night1)
      page.should have_content("You are not authorized")
    end

    it "should display the latest blog post on the game night page", :js => true do
      login(author1)
      night1.users << author1

      visit new_night_post_path(night1)
      fill_in "Title", :with => "A Sample Game Night Post Title"
      fill_in "Body", :with => "this is a post that belongs to a game night"
      click_link I18n.t('links.add_a_photo')
      fill_in "Photo Title", :with => "A Sample Game Night Photo Title"
      fill_in "Photo Caption", :with => "this is the photo caption that belongs to game night"
      attach_file("File Upload","#{Rails.root}/spec/samples/hutchhead.png")
      click_button I18n.t('buttons.create_post')

      visit night_path(night1)
      page.should have_content("A Sample Game Night Post Title")
    end

    it "should update the member list after adding a friend to the Game Night" do
      login(user1)

      @friendship = user1.friendships.build(:friend_id => user2.id)
      @friendship.save!

      @friendship2 = user1.friendships.build(:friend_id => user3.id)
      @friendship2.save!

      night1
      night1.users << user1

      visit night_path(night1)

      check("add_player_id[#{user3.id}]")

      click_button("add_players_to_night")

      visit night_path(night1)

      page.should have_css("#night_player_list_#{user3.id}")
    end

    it "should not show an invite form if all of your friends are members of the Game Night" do
      login(user1)

      @friendship = user1.friendships.build(:friend_id => user2.id)
      @friendship.save!

      @friendship2 = user1.friendships.build(:friend_id => user3.id)
      @friendship2.save!

      night1
      night1.users << user1
      night1.users << user2
      night1.users << user3

      page.should_not have_css("#add_players_to_night")

    end

#    it "offers an option to add as-a-friend-and-invite to a Game Night, then adds the friendship, but does not make them a player of that Game Night yet" do
#      login(user1)
#
#      night1
#      night1.users << user1
#
#      user2
#
#      visit night_path(night1)
#
#      fill_in "email", :with => user2.email
#      click_button("search_for_user")
#
#      page.should have_content(user2.name)
#
#      click_button("add_friend_and_invite_to_night")
#
#      visit night_path(night1)
#
#      page.should_not have_css("#night_player_list_#{user2.id}")
#      page.should have_css("#add_player_id_#{user2.id}")
#
#    end

  end
end
