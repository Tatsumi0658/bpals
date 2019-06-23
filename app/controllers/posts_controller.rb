class PostsController < ApplicationController
  before_action :set_post, only:[:edit, :update, :show, :destroy]
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.profile_id = current_profile.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post_comments = @post.post_comments
    @post_comment = @post.post_comments.build
    @favorite = current_profile.favorites.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def hashtag
    tag = Hashtag.find_by(hashtag: params[:name])
    @hashs = PostHashtagRelationship.where(hashtag_id: tag.id)
  end

  private

  def post_params
    params.require(:post).permit({images:[]}, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
