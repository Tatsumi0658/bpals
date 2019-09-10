class ProfilesController < ApplicationController
  before_action :set_profile, only:[:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only:[:new, :create, :show, :edit, :update, :destroy]
  def index
    @profiles = Profile.all
    @q = Profile.ransack(params[:q])
    @profiles = @q.result
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to posts_path, notice: t('view.alert.account')
    else
      render :new
    end
  end

  def show
    @purposes = ProfilePurposeRelationship.where(profile_id: @profile.id).all
    @posts = Post.where(profile_id: @profile.id).order("updated_at DESC")
    @favorites = Favorite.where(profile_id: @profile.id).order("updated_at DESC")
  end

  def edit
    @purposes = ProfilePurposeRelationship.where(profile_id: @profile).pluck(:purpose_id)
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile.id), notice: t('view.alert.update')
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to posts_path
  end

  private
  def profile_params
    params.require(:profile).permit(:nickname, :image, :age, :skintype, purpose_ids: [])
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
