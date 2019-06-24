class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_profile.favorites.create(post_id: @post.id)
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_profile.favorites.find_by(post_id: @post.id).destroy
    @posts = Post.all
  end
end
