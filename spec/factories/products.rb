FactoryGirl.define do
  factory :product do
    # sequence :email do |n|
    #   "person#{n}@example.com"
    # end

    sequence :title do |n|
      "title#{n}"
    end
    description "descriptiondescriptiondescription"
    price 123
    sales_price {rand(100)}



    
  end
end
