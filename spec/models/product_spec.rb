require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validation" do


    # it "requires prices" do
    #   p=Product.new
    #   p.valid?
    #   expect(p.errors).to(have_key(:price))
    # end

    it "requires title" do
      # p=Product.new
      p=FactoryGirl.build(:product,title:nil)
      p.valid?
      expect(p.errors).to(have_key(:title))

    end

    it "title requires unique" do
      # Product.create!(title: :"asd2",price: 180,sales_price: 100)
      # p=Product.create(title: :"asd2",price: 180,sales_price: 100)

      #Product.create!(title: :"asd2",price: 180,sales_price: 100)
      FactoryGirl.create(:product,title:"asd")
      p=FactoryGirl.build(:product,title:"asd")
      p.valid?
      expect(p.errors.messages).to(have_key(:title))

    end

    it "sales_price set to default" do
      p=Product.new({title: :"asd"})
      # p=Product.new({title: :"asd",description: "asdasd",price: 80})
      # p=FactoryGirl.build(:product,sales_price:nil)

      expect(p.sales_price).to(eq(5))
    end

    it "sales price less than price" do
      # p=Product.new({title: :"asd",price: 80,sales_price:100})
      p=FactoryGirl.build(:product,sales_price:5000)
      p.valid?
      expect(p.errors.messages).to(have_key(:sales_price))

    end

    it "is sales " do
      # p=Product.new({title: :"asd",description: "asdasd",price: 80,sales_price:60})
      p=FactoryGirl.create(:product,price:80,sales_price:60)

      expect(p.is_sales?).to(eq(true))

    end



  end


end
