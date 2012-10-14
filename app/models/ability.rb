class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.role?     :admin
                        can :manage, :all

    elsif user.role? :uploader
                        can :read, :all
                        cannot :manage, :all
                        can :create, [Photo, Comment, Friendship]
                        can :update, Post do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Post do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Friendship do |f|
                          f.try(:user) == user
                        end
                        can :update, Photo do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Photo do |p|
                          p.try(:user) == user
                        end
                        can :update, Comment do |c|
                          c.try(:user) == user
                        end
                        can :destroy, Comment do |c|
                          c.try(:user) == user
                        end
                        can [:games, :autocomplete_game_name, :search], User
                        can :manage, Game
                        can [:autocomplete_game_name], Game
                        can :show, [Photo, User]
                        can [:front, :dashboard], Content
    
    elsif user.role? :author
                        can :read, :all
                        cannot :manage, :all
                        can :create, [Post, Comment, Friendship]
                        can :update, Post do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Post do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Friendship do |f|
                          f.try(:user) == user
                        end
                        can :update, Comment do |c|
                          c.try(:user) == user
                        end
                        can :destroy, Comment do |c|
                          c.try(:user) == user
                        end
                        can [:games, :autocomplete_game_name, :search], User
                        can :show, [Post, User]
                        can :manage, Game
                        can [:autocomplete_game_name], Game
                        can [:front, :dashboard], Content

    elsif user.role? :friend
                        can :read, :all
                        cannot :manage, :all
                        can :create, [Comment, Friendship]
                        can :destroy, Friendship do |f|
                          f.try(:user) == user
                        end
                        can :destroy, Comment do |c|
                          c.try(:user) == user
                        end
                        can :update, Comment do |c|
                          c.try(:user) == user
                        end
                        can :destroy, Comment do |c|
                          c.try(:user) == user
                        end
                        can [:front, :dashboard], Content
                        can :show, Post
                        can :manage, Game
                        can [:autocomplete_game_name], Game
                        can [:show, :games, :search], User
    
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
                        can [:games, :autocomplete_game_name, :search], User
                        can :show, [Post, User]
                        can :manage, Game
                        can [:front, :dashboard], Content
    
    else              # guest
                        cannot :manage, :all
                        can [:show, :index], Post 
                        can [:show, :index], Photo
                        can [:show, :games, :autocomplete_game_name, :search], User
                        can :manage, Game
                        can [:front, :dashboard], Content

                    # open permissions cause we still need to set up default roles. delete this later.
                        can :read, :all
                        cannot :manage, :all
                        can :create, [Photo, Comment, Friendship]
                        can :update, Post do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Post do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Friendship do |f|
                          f.try(:user) == user
                        end
                        can :update, Photo do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Photo do |p|
                          p.try(:user) == user
                        end
                        can :update, Comment do |c|
                          c.try(:user) == user
                        end
                        can :destroy, Comment do |c|
                          c.try(:user) == user
                        end
                        can [:games, :autocomplete_game_name, :search], User
                        can :manage, Game
                        can [:autocomplete_game_name], Game
                        can :show, [Photo, User]
                        can [:front, :dashboard], Content
    end
  end
end
