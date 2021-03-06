class UserMailer < ApplicationMailer
  default from: "afidedev26@gmail.com"
  helper :application
  layout 'mailer'

  def contact_form(email, name, message)
    @message = message
      mail(:from    => email,
           :to      => "afidedev26@gmail.com",
           :subject => "New message from #{name}.")
  end


  def order_complete(user,product)
      @user = user
      @product = product
      mail(to: @user.email, subject: 'Thank you from Bike Berlin!')
  end

end