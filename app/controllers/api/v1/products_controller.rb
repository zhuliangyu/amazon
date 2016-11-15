class Api::V1::ProductsController < ApplicationController

  protect_from_forgery with: :null_session
  before_action :authentication


  def index
    @products=Product.order("created_at DESC").limit(10)
    # respond_to do |format|
    #   format.json { render json: @products }
    #
    # end
    render json: @products


  end

  def create
    # render json: {a: 'b'}
    product_params=params.require(:product).permit([:title, :description, :price])

    product=Product.new(product_params)
    if product.save
      render json: {id: product.id, status: 'create success'}

    else
      render json: {status: 'create failure', error: product.errors.full_messages.join(',')}


    end

  end

  def update
    # render json: {a: 'b'}
    product_params=params.require(:product).permit([:title, :description, :price])

    product=Product.find_by(id:params[:id])
    if product
      product.update(product_params)
      render json: {id: product.id, status: 'update success'}

    else
      render json: {status: 'update failure', error: product.errors.full_messages.join(',')}

    end

  end

  def destroy
    product_id=params[:id]
    product=Product.find_by(id: product_id)
    if product
      product.destroy
      render json: {status: "success to delete"}
    else
      render json: {status: "failure to delete,because product is not avaiable"}


    end


  end


  private
  def authentication

    user=User.find_by(api_key: params[:api_key])

    head :unauthorized unless user


  end


end
