class Friend < ActiveRecord::Base
    attr_accessible :user_id
    belongs_to :user

    validates_presence_of :user_id
end
