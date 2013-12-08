class UserMailer < ActionMailer::Base
  default from: "ericalhorowitz@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  
  def contact_email(email_params)
    # You only need to customize @recipients.
    @recipients = "contact@website.co.uk"
    @from = email_params[:name] + " <" + email_params[:address] + ">"
    @subject = email_params[:subject]
    @sent_on = Time.now
    @body["email_body"] = email_params[:body]
    @body["email_name"] = email_params[:name]
    content_type "text/html"
  end
end
