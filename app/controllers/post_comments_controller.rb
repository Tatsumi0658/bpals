class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.build(post_comment_params)
    @post_comment.profile_id = current_profile.id
    respond_to do |format|
      if @post_comment.save
        format.js { render :index }
      else
        format.html{ redirect_to post_path(@post)}
      end
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:post_id, :content)
  end
end
