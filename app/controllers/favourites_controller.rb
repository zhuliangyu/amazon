class FavouritesController < ApplicationController
  def create
    favour = Favourite.new
    product = Product.find params[:product_id]
    favour.product = product
    favour.user = current_user
    if favour.save
      redirect_to product_path(product), notice: "Thanks for liking!"
    else
      redirect_to product_path(product), alert: "Can't like! Liked already?"
    end
  end


  def destroy
    favour=current_user.favourites.find(params[:id])
    @product=favour.product

    favour.destroy
    redirect_to product_path(@product), notice: "Like remove!"

  end

end
