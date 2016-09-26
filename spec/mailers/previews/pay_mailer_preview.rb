# Preview all emails at http://localhost:3000/rails/mailers/pay_mailer
class PayMailerPreview < ActionMailer::Preview
  def payreceived
    PayMailer.payreceived("alan@example.com", "Alan", "Hello from Bike Berlin.")
  end
end
