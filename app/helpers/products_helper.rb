module ProductsHelper
  def stripe_price(price)
    (price * 100).to_i
  end
end