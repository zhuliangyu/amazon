FactoryGirl.define do
  factory :review do
    association :user,factory: :user
    association :product,factory: :product
    body "MyTextreview"
    star_count 3
  end
end
