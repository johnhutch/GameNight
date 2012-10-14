module ContentsHelper

    def friendship_classname(friendship)
        if current_user.inverse_friends.include?(friendship)
            classname = "twoway"
        else
            classname = "oneway"
        end
        classname
    end
end
