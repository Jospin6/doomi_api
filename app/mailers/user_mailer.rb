class UserMailer < ApplicationMailer
    default from: 'no-reply@example.com'

    def confirmation_email(user)
        @user = user
        mail(to: @user.email, subject: 'Confirmation de votre compte')
    end
end
