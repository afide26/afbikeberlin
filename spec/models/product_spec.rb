require 'rails_helper'

describe Product do
  context "when products have comments" do

    # Initialize
    before do

      @product = FactoryGirl.create(:product)
      # @user = User.create!(:email =>"alan@example.com", :password=> "alanfidelino")
      @user = FactoryGirl.create(:user)
      @product.comments.create!(rating: 1, user: @user, body: "awesome bicycle!")
      @product.comments.create!(rating: 3, user: @user, body: "what a great ride!")
      @product.comments.create!(rating: 5, user: @user, body: "Lovely bicycle!")
    end

    it "returns an average rating of comments" do
      expect(@product.avg_rating).to eq(3)
    end
  end

  context "when products are created" do
    before do
      @product = Product.new(name:"", price:200)
    end

    it "should not be valid when name is not present" do
      expect(@product).not_to be_valid
    end

    it "should be valid when name is present" do
      @product = Product.new(name:"new bike", price:200)
      expect(@product).to be_valid
    end
  end
end