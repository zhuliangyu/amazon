class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :reviews,dependent: :destroy
  has_many :favourites,dependent: :destroy

  has_many :products,through: :favourites
  has_many :likes
  has_many :reviews,through: :likes



  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: VALID_EMAIL_REGEX

  before_create :generate_api_key


  def full_name
    @full_name=first_name.capitalize+" "+last_name.capitalize

  end

  def generate_api_key
    self.api_key=SecureRandom.hex(32)


  end

end
