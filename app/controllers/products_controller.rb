class ProductsController < ApplicationController
  before_action :authenticate_user, except: [:show, :index]

  def new
    @p=Product.new
    @c=Category.all
  end

  def create
    arr=params[:pet]

    user=current_user

    product_param=get_params
    @p=Product.new(product_param)
    @p.user =user
    if @p.save
      # render plain: "hi"
      redirect_to product_path(@p)
    else
      render :new
    end

  end

  def show
    @p= Product.find(params[:id])
    @review=Review.new
    respond_to do |format|
      format.html{render}
      # http://localhost:3000/products/1.json
      format.json{render json:@p.to_json}
    end
  end

  def index
    @ps=Product.all
    respond_to do |format|
      format.html { render }
      # http://localhost:3000/products.json
      format.json {render json:@ps.to_json}

    end

  end

  def destroy
    @p=Product.find(params[:id])
    @p.destroy

    redirect_to products_path


  end

  def edit
    @p=Product.find params[:id]

  end

  def update
    # product_param=params.require(:product).permit(:title, :description, :price, :category_id,tag_ids: [])
    product_param=get_params


    @p=Product.find(params[:id])
    @p.update(product_param)
    redirect_to product_path(@p)

  end

  private
  def get_params
    params.require(:product).permit(:title, :description, :price, :category_id, tag_ids: [])
  end

end
