class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # load user signed in, or create new for guest

    @user.roles.each { |role| send role.name }

    if @user.roles.size == 0  # for guests without roles
      can :read, [Content, User, Post, Photo, Comment]
      can [:front, :contact], Content
      can :games, User
    end
  end

  def nobody
    can :read, [Content, User, Post, Photo, Comment]
    can [:front, :contact], Content
    can :games, User
  end

  def commenter
    can :create, Comment
    can [:update, :destroy], Comment, :user_id => @user.id
  end

  def friend
    can :dashboard, Content
    can [:create, :read, :autocomplete_game_name], Game
    can :create, Friendship
    can :destroy, Friendship, :user_id => @user.id
    can :create, Night
    can [:read, :update], Night, :users => { :id => @user.id } # only if the user belongs to that Game Night
    can [:search, :friend_request], User
  end

  def author
    can :create, Post
    can [:update, :destroy], Post, :user_id => @user.id
  end

  def uploader
    can :create, Photo
    can [:update, :destroy], Photo, :user_id => @user.id
  end

  def admin
    can :manage, :all # the usual update/destroy, but for any model, not just those owned by user
    can [:create, :update, :destroy], Content
    can [:create, :update, :destroy], User
    can [:update, :destroy], Game
    can :manage, Role
  end
end
