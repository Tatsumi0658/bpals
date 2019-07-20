class UsersController < ApplicationController
  def index
    @users = User.where.not(id:current_user.id).all
  end

  def edit
    @user = User.find(params[:id])
    if @user.admin_flag == true
      @user.admin_flag = false
      @user.save
      redirect_to users_path
    else
      @user.admin_flag = true
      @user.save
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
