class ProductsController < ApplicationController
#   HTTP 方法	路径	        控制器#动作	作用
#   GET	     /photos	        photos#index	显示所有图片    photos_path
# GET	     /photos/new	photos#new	显示新建图片的表单 new_photo_path
#   POST	     /photos	        photos#create	新建图片 photos_path
# GET	     /photos/:id	photos#show	显示指定的图片 photo_path(:id)
#   GET	     /photos/:id/edit	photos#edit	显示编辑图片的表单 edit_photo_path(:id)
#   PATCH/PUT    /photos/:id	photos#update	更新指定的图片 photo_path(:id)
#   DELETE	     /photos/:id	photos#destroy	删除指定的图片 photo_path(:id)

  def new
    @p=Product.new
  end

  def create
    product_param=params.require(:product).permit(:title,:description,:price)
    @p=Product.new(product_param)
    @p.save
    # render plain: "hi"
    redirect_to product_path(@p)

  end

  def show
    @p= Product.find(params[:id])
  end

  def index
    @ps=Product.all

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
    product_param=params.require(:product).permit(:title,:description,:price)
    @p=Product.find(params[:id])
    @p.update(product_param)
    redirect_to product_path(@p)

  end
end
