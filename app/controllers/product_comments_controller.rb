class ProductCommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @product_comment = @product.product_comments.build(product_comment_params)
    @product_comment.profile_id = current_profile.id
    respond_to do |format|
      if @product_comment.save
        format.js { render :index }
      else
        format.js { render :error }
      end
    end
  end

  def destroy
    @product_comment = ProductComment.find_by(id: params[:id], product_id: params[:product_id], profile_id: current_profile.id)
    if @product_comment.destroy
      render :index
    end
  end

  private
  def product_comment_params
    params.require(:product_comment).permit(:product_id, :content)
  end
end
