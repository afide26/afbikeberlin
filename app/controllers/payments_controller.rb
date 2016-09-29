 class PaymentsController < ApplicationController
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

    # Create the charge on Stripe servers - this will charge the user's card

    begin
      charge = Stripe::Charge.create(
        :amount      => (@product.price*100).to_i,
        :currency    => "aud",
        :source      => token,
        :description => params[:stripeEmail]
        )

      if charge.paid
        Order.create(
          :product_id => @product.id,
          :user_id => @user.id,
          :total => @product.price
          )

      end
      UserMailer.order_complete(@user.email, @user.first_name, @product).deliver_now
    flash.now[:success] = "Your transaction processed successfully!"
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
  end
end