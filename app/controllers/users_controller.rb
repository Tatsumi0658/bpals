class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user.admin_flag == true
      @user.update(admin_flag: false)
    else
      @user.update(admin_flag: true)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
