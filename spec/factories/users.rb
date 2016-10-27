FactoryGirl.define do
  factory :user do
    first_name "zhu"
    last_name "asdasdasdasdasd"
    sequence :email do |n|
      Faker::Internet.email +"person#{n+rand(1000)}@example.com"
    end

    password "123456"
  end
end
