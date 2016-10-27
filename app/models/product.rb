class Product < ApplicationRecord
  has_many :reviews,dependent: :destroy
  belongs_to :category
  belongs_to :user
  has_many :favourites,dependent: :destroy
  has_many :users,through: :favourites




  validates :title, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :title, :presence => true,:uniqueness => true
  validates :price, :presence=>true
  validates :sales_price, :numericality => {less_than: :price}
  after_initialize :init_config

  def init_config
    self.sales_price||= 5
  end

  def is_sales?
    # self.price>self.sales_price
    self.price>sales_price
  end

  def favour_by?(user)
    # likes.find_by_user_id(user.id).present?
    favourites.find_by(user_id: user.id).present?
  end

  # validates (:price, {numericality: {greater_than: 1}})
  # validates :description, length: { maximum: 10 }



  # def search(words)
  #
  #
  # end




end
