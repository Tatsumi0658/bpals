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

  def destroy
    @post_comment = PostComment.find_by(id: params[:id], post_id: params[:post_id], profile_id: current_profile.id)
    if @post_comment.destroy
      render :index
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:post_id, :content)
  end
end
