FactoryGirl.define do

  factory :product do
    name "Racing Bicycle"
    price 3.00
    comments []
  end

  factory :product_two, class:User do
    name "Mountain Bicycle"
    price 4.00
    comments []
  end
end