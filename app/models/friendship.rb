class Friendship < ActiveRecord::Base
    attr_accessible :friend_id, :user_id

    belongs_to :user
    belongs_to :friend, :class_name => 'User'

    validates :friend_id, :uniqueness => {:scope => :user_id, :message => I18n.t('flash.friendship_exists')}
end
