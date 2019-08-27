class PostsController < ApplicationController
  before_action :set_post, only:[:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :current_profile!, only:[:new, :create, :edit, :update, :destroy]
  def index
    @posts = Post.page(params[:page]).per(12).includes(:profile)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.profile_id = current_profile.id
    if @post.save
      redirect_to posts_path, notice: "投稿完了"
    else
      render :new
    end
  end

  def show
    @post_comments = @post.post_comments.includes(:profile)
    @post_comment = @post.post_comments.build
    unless current_profile.nil?
      @favorite = current_profile.favorites.find_by(post_id: @post.id)
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice:"更新完了"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除完了"
  end

  def hashtag
    tag = Hashtag.find_by(hashtag: params[:name])
    @hashs = PostHashtagRelationship.where(hashtag_id: tag.id)
  end

  def search
    if tag = Hashtag.find_by(hashtag: params[:search])
      @hashs = PostHashtagRelationship.where(hashtag_id: tag.id)
    else
      @hashs = nil
    end
  end

  private

  def post_params
    params.require(:post).permit({images:[]}, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def current_profile!
    unless current_profile.present?
      redirect_to new_profile_path
    end
  end
end
