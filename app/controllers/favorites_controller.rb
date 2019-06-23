class FavoritesController < ApplicationController
  def create
    favorite = current_profile.favorites.create(post_id: params[:post_id])
    redirect_to post_path(post_id)
  end

  def destroy
    favorite = current_profile.favorites.find_by(id: params[:id]).destroy
    redirect_to post_path(post_id)
  end
end
