require 'rails_helper'

RSpec.describe User, type: :model do
  # User Model
  # – first_name must be present
  # – last_name must be present
  # – email must be unique
  describe "user model" do
    it "first_name must be present " do
      user=FactoryGirl.build(:user, first_name: nil)
      user.valid?
      expect(user.errors).to have_key(:first_name)


    end
    it "last_name must be present" do
      user=FactoryGirl.build(:user, last_name: nil)
      user.valid?
      expect(user.errors).to have_key(:last_name)

    end
    it "email must be unique" do
      user1=FactoryGirl.create(:user, email: "zhu@126.com")
      user2=FactoryGirl.build(:user, email: "zhu@126.com")
      user2.valid?
      expect(user2.errors).to have_key(:email)



    end

    #– full_name method must return first_name and last_name concatenated & titleized

    it "give us the full_name" do
      user=FactoryGirl.build(:user,first_name:"asd",last_name:"das")
      name=user.full_name
      expect(name).to eq("Asd Das")


    end

  end


end
