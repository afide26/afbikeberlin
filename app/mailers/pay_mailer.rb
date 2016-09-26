class PayMailer < ApplicationMailer
  default from: "afidedev26@gmail.com"

  def payreceived(email,product)
      @message= "Thank you for trusting Bike Berlin and buying #{product.name}"
      mail(
           :to      => email)
  end
end
