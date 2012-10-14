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
                        can :show, [Photo, User]
                        can :front, Content
    
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
                        can :show, [Post, User]
                        can :front, Content

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
                        can :front, Content
                        can :show, [Post, User]
    
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
                        can :show, [Post]
                        can :front, Content
    
    else              # guest
                        cannot :manage, :all
                        can [:show, :index], Post 
                        can [:show, :index], Photo
                        can [:show], User
                        can :games, User
                        can :front, Content
    end
  end
end
