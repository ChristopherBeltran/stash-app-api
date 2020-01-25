class UserMailer < ActionMailer::Base
    default from: 'stashnewsapp@gmail.com'
    #layout 'mailer'

    def forgot_password(user)
        @user = user
        @greeting = "Hi"
        
        mail to: user.email, :subject => 'Reset password instructions'
      end

    end