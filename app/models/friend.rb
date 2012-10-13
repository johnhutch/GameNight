class Friend < ActiveRecord::Base
    attr_accessible :verified
    has_and_belongs_to_many :users
end
