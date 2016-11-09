class ReviewsController < ApplicationController
  before_action :authenticate_user

  def create
    #   @post = Post.find params[:post_id]
    #
    #   comment_params = params.require(:comment).permit(:body)
    #
    #   @comment = Comment.new comment_params
    #
    #   @comment.post = @post
    #
    #   if @comment.save
    #     redirect_to post_path(@post), notice: "Comment created"
    #
    #   else
    #
    #     render "/posts/show"
    #
    #   end
    #
    @p=Product.find params[:product_id]
    review_params=params.require(:review).permit(:body, :star_count)
    @review=Review.new(review_params)
    @review.product=@p

    @user=current_user
    @review.user=@user

    respond_to do |format|
      if @review.save
        format.html{redirect_to product_path(@p)}
        format.js{render :create_success}
      else
        format.html{render "/products/show"}
        format.js{render :create_failure}


      end


    end



  end

  def destroy
    # render json:params
    # @p=Product.find params[:product_id]
    @review=Review.find params[:id]
    # @p=Product.find(@review.product_id)
    @review.destroy

    respond_to do |format|
      format.html { redirect_to product_path(@review.product_id) }
      format.js{render}
    end


  end

end

