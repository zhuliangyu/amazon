require 'rails_helper'

RSpec.describe Review, type: :model do
# Test drive a validation that star count is required

it "Test drive a validation that star count is required" do
  r=FactoryGirl.build(:review,star_count:nil)

  r.valid?

  expect(r.errors).to(have_key(:star_count))
end

  it "must be a number between 1 and 5 inclusive" do

    r=FactoryGirl.build(:review,star_count:10)
    r.valid?

    expect(r.errors).to(have_key(:star_count))

  end
# must be a number between 1 and 5 inclusive


end
