FactoryGirl.define do
  factory :product do
    # sequence :email do |n|
    #   "person#{n}@example.com"
    # end
    association :category,factory: :category
    association :user,factory: :user


    sequence :title do |n|
      Faker::Name.title + "title#{n}"
    end
    sequence :description do |n| Faker::Name.title+"descriptiondescriptiondescription"

    end
    price 123
    sales_price {rand(100)}



    
  end
end
