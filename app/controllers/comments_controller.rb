class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @user = request.env['warden'].user
    respond_to do |format|
      if @comment.save
        # ActionCable.server.broadcast 'product_channel', comment: @comment
        format.html{render :show, success: 'Comment was created successfully'}
        format.json{render :show, status: :created, location: @product}
        format.js
      else
        format.html{redirect_to @product, warning: 'Your comment was not saved. Check ratings or comments length'}
        format.json{render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product

    @comment.destroy
    flash[:danger] = "Comment deleted."
    redirect_to product
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id,:body, :rating)
    end
end