class UserMailer < ApplicationMailer
	default from: 'dylynch91@gmail.com'
 
  def confirmation(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Confirmation: Thank you for using Professional Painters!')
  end

  def estimate_request(user)
  	@user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Estimate Requested')
  end
end
