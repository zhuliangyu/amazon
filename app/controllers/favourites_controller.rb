class FavouritesController < ApplicationController



  def create
    favour = Favourite.new
    product = Product.find params[:product_id]
    favour.product = product
    favour.user = current_user
    # binding.pry
    if can?(:favour,product,current_user) &&favour.save
      redirect_to product_path(product), notice: "Thanks for liking!"
    else
      redirect_to product_path(product), alert: "Can't like! Liked already?"
    end
  end


  def destroy
    #id is product_id passed from erb file
    @p=Product.find_by(id: params[:id])
    favour= current_user.favourites.find_by(product: @p)
    # favour=current_user.favourites.find(params[:id])

    favour.destroy
    redirect_to product_path(@p), notice: "Like remove!"
  end

end
