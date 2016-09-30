# Preview all emails at user_mailer http://localhost:3000/rails/mailers/
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("alan@example.com", "Alan", "Hello from Bike Berlin.")
  end

  def order_complete
    UserMailer.order_complete(User.first, Product.first)
  end
end