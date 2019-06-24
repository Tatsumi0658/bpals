class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_profile.favorites.create(post_id: @post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_profile.favorites.find_by(post_id: @post.id).destroy
  end
end
