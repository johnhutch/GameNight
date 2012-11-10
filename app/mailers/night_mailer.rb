class NightMailer < ActionMailer::Base
  default from: Settings.admin_user.email

  def friended_email(user, friend)
    @user = user
    @friend = friend
    @url = user_url(friend)
    mail(:to => user.email, :subject => "#{friend.name} has friended you on Game Night!")
  end

  def invite_email(email, friend)
    @friend = friend
    @url = new_user_session_path
    @friend_url = user_url(friend)
    mail(:to => email, :subject => "#{friend.name} has invited you to Game Night!")
  end
end
