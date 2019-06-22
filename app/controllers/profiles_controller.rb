class ProfilesController < ApplicationController
  before_action :set_profile, only:[:edit, :update, :show, :destroy]
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profiles_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      rediirect_to profiles_path
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private
  def profile_params
    params.require(:profile).permit(:nickname, :image, :age, :skintype, :purpose)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
