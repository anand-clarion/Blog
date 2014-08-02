class UserMailer < ActionMailer::Base
  default from: "Blog.application@gmail.com"
  
  #This action send email to new registered user
  def welcome_email(user)
    @user = user
    @url  = 'http://blog.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  # This action send a email to user after user account activation.
  def account_activated(user)
    @user = user
    @url  = 'http://blog.com/login'
    mail(to: @user.email, subject: 'Congrat your account has been activated')
  end

  #This action send a email to user after user account deactivation
  def account_deactivated(user)
    @user = user
    @url  = 'http://blog.com/login'
    mail(to: @user.email, subject: 'Your account has been De-activated from blog.com')
  end
  
end
