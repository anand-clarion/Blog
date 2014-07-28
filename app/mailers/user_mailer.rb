class UserMailer < ActionMailer::Base
  default from: "Blog.application@gmail.com"
  
  #This action send email to new registered user
  def welcome_email(user)
    @user = user
    @url  = 'http://blog.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
