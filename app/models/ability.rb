class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.role?     :admin
                        can :manage, :all

    elsif user.role? :uploader
                        can :read, :all
                        cannot :manage, :all
                        can :create, [Photo]
                        can :update, Photo do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Photo do |p|
                          p.try(:user) == user
                        end
                        can [:games, :add_game, :remove_game, :autocomplete_game_name], User
                        can :show, [Photo]
                        can :front, Content
    
    elsif user.role? :author
                        can :read, :all
                        cannot :manage, :all
                        can :create, [Post, Comment]
                        can :update, Post do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Post do |p|
                          p.try(:user) == user
                        end
                        can :update, Comment do |c|
                          c.try(:user) == user
                        end
                        can :destroy, Comment do |c|
                          c.try(:user) == user
                        end
                        can [:games, :add_game, :remove_game, :autocomplete_game_name], User
                        can :show, [Post]
                        can :front, Content
    
    elsif user.role? :commenter
                        can :read, :all
                        cannot :manage, :all
                        can :create, [Comment]
                        can :update, Comment do |c|
                          c.try(:user) == user
                        end
                        can :destroy, Comment do |c|
                          c.try(:user) == user
                        end
                        can [:games, :add_game, :remove_game, :autocomplete_game_name], User
                        can :show, [Post]
                        can :front, Content

    elsif user.role? :friend
                        can :read, :all
                        cannot :manage, :all
                        can :show, Post
                        can :front, Content
                        can [:show, :friend_request, :games, :add_game, :remove_game, :autocomplete_game_name], User
    
    else              # guest
                        cannot :manage, :all
                        can [:show, :index], Post 
                        can [:show, :index], Photo
                        can [:show, :games, :add_game, :remove_game, :autocomplete_game_name], User
                        can :front, Content
    end
  end
end
