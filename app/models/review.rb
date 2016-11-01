class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :body, :presence => true, length: {minimum: 2}
  validates :star_count, numericality: {less_than_or_equal_to: 5}

  belongs_to :user
  has_many :likes
  has_many :users,through: :likes

end
