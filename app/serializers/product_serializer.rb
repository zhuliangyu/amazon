class ProductSerializer < ActiveModel::Serializer
  # tag, numer of like,number of seller, details price, sale price

  attributes :id
  attributes :price
  attributes :sales_price
  attributes :number_of_like
  attributes :name_of_seller
  # attributes :tag_of_product
  has_many :tags

  def number_of_like
    Favourite.where(product: object).count

  end


  def name_of_seller
    @user=User.find_by(id: object.user_id)
    if @user
      @user.full_name
    else
      "Anoymous"


    end

  end



  # def tag_of_product
  #   Tagging.where(roduct:object)
  #
  # end


end
